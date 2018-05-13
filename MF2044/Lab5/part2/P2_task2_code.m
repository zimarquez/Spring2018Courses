function [exectime, data] = P2_task2_code(seg, data)

global glbData;

switch seg      
    % lock globals
    case 1
        ttEnterMonitor('P2_monitor');
        exectime = 0;
    % set global x
    case 2
        glbData.x = 2;
        exectime = data.wcetX;       
    % set global y
    case 3
        glbData.y = 2;
        exectime = data.wcetY;
    % calculate and display sum
    case 4
        sum = glbData.x + glbData.y;
        glbData.sum = sum;
        ttAnalogOut(2, sum);
        exectime = 0;
    %unlock globals
    case 5
        ttExitMonitor('P2_monitor');
        exectime = -1;
end