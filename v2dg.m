close all;

% take in video
fileName = 'elsa.mp4';
outputFileName = 'dithered.gif';
video = VideoReader(fileName);
frameCount = video.NumFrames;

imageSet = zeros(540, 960, 100);
imageIterator = 1;
while (hasFrame(video))
   frame = readFrame(video);
   
%    if (imageIterator == 1)
%         height = size(frame);
%         
%         if (height > 500)
%             scaleFactor = 500 / height;
%         else
%             scaleFactor = 1;
%         end
%    end
   
   frame = imresize(frame, 1);
   frame = rgb2gray(frame);
   frame = dither(frame);
       
   if imageIterator == 1
       %// For 1st image, start the 'LoopCount'.
       imwrite(frame, outputFileName, 'gif', 'LoopCount', Inf, 'DelayTime', 0.003);
   else
       imwrite(frame, outputFileName, 'gif', 'WriteMode', 'append', 'DelayTime', 0.03);
   end
   
   imageIterator = imageIterator + 1;
end
