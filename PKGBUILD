# Maintainer: VanillaGreen <brad@vanillagreen.com>
#
# The release package. docs/architecture/distribution.md
# states the rules scripts/check-packaging.js enforces on this file and on
# ../vgshell-git/PKGBUILD. sha256sums stays SKIP only until the tag v$pkgver
# exists; the release pins the tarball's sum.

pkgname=vgshell
pkgver=0.1.2
pkgrel=1
pkgdesc='Desktop shell for Hyprland, built on Quickshell'
arch=('any')
url='https://github.com/vanillagreencom/vgshell'
license=('MIT AND OFL-1.1 AND ISC AND Apache-2.0 AND CC-BY-SA-4.0')
depends=(
  'greetd'
  'glibc'
  'vgshell-quickshell>=0.3.1'
  'hyprland>=0.56'
  'bash'
  'coreutils'
  'util-linux'
  'nodejs>=18'
  'python'
  'libxkbcommon'
  'xkeyboard-config'
  'git'
  'bubblewrap'
  'curl'
  'dbus'
  'fd'
  'ffmpeg'
  'file'
  'fontconfig'
  'fzf'
  'gawk'
  'glib2'
  'gpu-screen-recorder'
  'grim'
  'gum'
  'hyprpicker'
  'imagemagick'
  'iproute2'
  'less'
  'libnotify'
  'libpulse'
  'libsecret'
  'mise'
  'networkmanager'
  'pacman-contrib'
  'pipewire'
  'pipewire-audio'
  'playerctl'
  'qrencode'
  'rclone'
  'sed'
  'slurp'
  'systemd'
  'tesseract'
  'tesseract-data-eng'
  'vsys'
  'wireplumber'
  'wl-clipboard'
  'wtype'
  'xdg-desktop-portal-gnome'
  'xdg-desktop-portal-gtk'
  'xdg-desktop-portal-hyprland'
  'xdg-terminal-exec'
  'xdg-utils'
)
optdepends=(
  'chromium: browser features in the bar and Jarvis'
  'uv: Jarvis local voice model setup'
  'agent-browser-bin: Jarvis browser actions'
  'wlrctl: Jarvis desktop input'
  'ttfx: animates the Screensaver text art'
  'power-profiles-daemon: switches the power profile in the Power plugin'
  'hdparm: lets idle hard disks stop spinning in the Power plugin'
  'bandwhich: See all network traffic in the Network Traffic plugin'
  'libcap: check and allow traffic capture in the Network Traffic plugin'
  'btop: all processes and system readings from the System monitor panel'
  'claude-code: sign in to Claude Code and use its account as the Jarvis AI model'
  'openai-codex: sign in to Codex and use its account as the Jarvis AI model'
  'voxtype-bin: Voice dictation engine'
  'tmux: several Jarvis coding tasks at once'
  'kendex-bin: the mail tool Jarvis hands a request for your agent fleet with'
  'ydotool: Jarvis pointer fallback with an already running input service'
  'bluez-utils: bluetoothctl, the Bluetooth pairing agent that answers pairing prompts'
  'bluez: the Bluetooth service the Bluetooth plugin connects your devices through'
  'snapper: a snapshot before the update pipeline changes packages'
  'timeshift: a snapshot before the update pipeline changes packages, without snapper'
  'sudo: package installs and the browser policy writer in floating TUIs'
  'nvidia-utils: verifies a selected Jarvis CUDA local voice tier'
  'ddcutil: brightness of external displays in the Displays plugin'
  'brightnessctl: brightness of a laptop built-in display in the Displays plugin'
  'cronie: crontab, which schedules automations where no systemd user manager answers'
  'uwsm: the Hyprland (uwsm-managed) session the login screen starts first'
  'xorg-xinit: startx, for X11 sessions on the login screen'
  'polkit: pkexec, so applications can ask for administrator access'
  'tailscale: the Tailscale connection in the VPN plugin'
  'cups: lpstat and ipptool, which list your printers and their changes in the Printers plugin'
  'cups-pk-helper: adds, removes and sets the default printer in the Printers plugin'
  'system-config-printer: Print Settings, for drivers, paper size and quality in the Printers plugin'
  'imv: opens a saved screenshot from its Capture notification'
  'satty: edits a saved screenshot from its Capture notification'
  'mpv: plays a saved recording from its Capture notification'
  'google-chrome: opens a calendar day in a Google Chrome profile'
  'brave-bin: opens a calendar day in a Brave profile'
  'vivaldi: opens a calendar day in a Vivaldi profile'
  'microsoft-edge-stable-bin: opens a calendar day in a Microsoft Edge profile'
)
source=("vgshell-$pkgver.tar.gz::$url/releases/download/v$pkgver/vgshell-$pkgver.tar.gz")
sha256sums=('45b1358972f7fc0ec25688462bbd585953a4980fef35142be96067f1a5b6c06e')
install=vgshell.install

package() {
  cd "vgshell-$pkgver"
  DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc ./packaging/install-system.sh
}
