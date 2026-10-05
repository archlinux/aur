# Maintainer: VanillaGreen <brad@vanillagreen.com>
#
# The release package. docs/architecture/distribution-arch.md
# states the rules scripts/check-packaging.js enforces on this file and on
# ../vgshell-git/PKGBUILD. sha256sums stays SKIP only until the tag v$pkgver
# exists; the release pins the tarball's sum.

pkgname=vgshell
pkgver=0.1.0
pkgrel=1
pkgdesc='Desktop shell for Hyprland, built on Quickshell'
arch=('any')
url='https://github.com/vanillagreencom/vgshell'
license=('MIT AND OFL-1.1 AND ISC AND Apache-2.0')
depends=(
  'quickshell>=0.3.1'
  'hyprland>=0.56'
  'bash'
  'coreutils'
  'util-linux'
  'nodejs>=18'
  'python'
  'libxkbcommon'
  'xkeyboard-config'
  'git'
  'agent-browser-bin'
  'bubblewrap'
  'chromium'
  'curl'
  'dbus'
  'fd'
  'ffmpeg'
  'file'
  'fzf'
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
  'slurp'
  'systemd'
  'tesseract'
  'tesseract-data-eng'
  'uv'
  'vsys'
  'wireplumber'
  'wl-clipboard'
  'wlrctl'
  'wtype'
  'xdg-terminal-exec'
  'xdg-utils'
)
optdepends=(
  'voxtype-bin: Voice dictation engine'
  'tmux: several Jarvis coding tasks at once'
  'ydotool: Jarvis pointer fallback with an already running input service'
  'bluez-utils: bluetoothctl, the Bluetooth pairing agent that answers pairing prompts'
  'snapper: a snapshot before the update pipeline changes packages'
  'timeshift: a snapshot before the update pipeline changes packages, without snapper'
  'sudo: package installs and the browser policy writer in floating TUIs'
  'nvidia-utils: verifies a selected Jarvis CUDA local voice tier'
  'ddcutil: brightness of external displays in the Displays plugin'
  'brightnessctl: brightness of a laptop built-in display in the Displays plugin'
  'cronie: crontab, which schedules automations where no systemd user manager answers'
  'greetd: the login screen at boot'
  'uwsm: the Hyprland (uwsm-managed) session the login screen starts first'
  'xorg-xinit: startx, for X11 sessions on the login screen'
  'glibc: getent, the accounts on the login screen'
  'polkit: pkexec, so applications can ask for administrator access'
  'tailscale: the Tailscale connection in the VPN plugin'
)
source=("vgshell-$pkgver.tar.gz::$url/releases/download/v$pkgver/vgshell-$pkgver.tar.gz")
sha256sums=('18239c1dcef84b8d07187085c183cb42244abdac0f16a82c5d57318deb560612')
install=vgshell.install

package() {
  cd "vgshell-$pkgver"
  DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc ./packaging/install-system.sh
}
