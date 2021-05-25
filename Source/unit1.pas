unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Windows, Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    EditInterval: TEdit;
    GroupBoxInterval: TGroupBox;
    TimerInterval: TTimer;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerIntervalTimer(Sender: TObject);
  private

  public

  end;

var
   MainForm: TMainForm;

implementation

{$R *.lfm}

// Форма создалась
procedure TMainForm.FormCreate(Sender: TObject);
begin
     EditInterval.Text := '60';
end;

// Форма закрылась
procedure TMainForm.FormDestroy(Sender: TObject);
begin
     TimerInterval.Enabled := False;
end;

// Кнопка Старт
procedure TMainForm.ButtonStartClick(Sender: TObject);
begin
     ButtonStart.Enabled := False;
     TimerInterval.Enabled := True;
     TimerInterval.Interval := StrToInt(EditInterval.Text) * 1000;
     EditInterval.Enabled := False;
end;

// Кнопка Стоп
procedure TMainForm.ButtonStopClick(Sender: TObject);
begin
     ButtonStart.Enabled := True;
     TimerInterval.Enabled := False;
     EditInterval.Enabled := True;
end;

// Таймер интервала
procedure TMainForm.TimerIntervalTimer(Sender: TObject);
var
   CursorPos: TPoint;
begin
     GetCursorPos(CursorPos);
     SetCursorPos(CursorPos.X + 1, CursorPos.Y + 1);
     Mouse_Event(MOUSEEVENTF_MOVE, 0, 0, 0, 0);
end;

end.

