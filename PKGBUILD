# Maintainer: Zan Skamljic <zan.skamljic@gmail.com>

_pkgname=tde-session
pkgname=tde-session-bin
pkgver=0.3.9
pkgrel=1
pkgdesc='The TDE desktop session: a wlroots compositor, overview, bar, lock screen and settings'
arch=(x86_64)
url='https://github.com/zskamljic/tde-session'
license=(GPL-3.0-or-later)
depends=(
  glibc
  layer-shell-qt
  libcanberra
  libgcc
  libinput
  libpulse
  libsecret
  libstdc++
  'libtde>=0.3.0'
  libxkbcommon
  lua
  openssh
  pam
  pango
  pixman
  polkit-qt6
  qt6-base
  qt6-wayland
  sound-theme-freedesktop
  systemd
  wayland
  wlroots0.20
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
)
optdepends=(
  'tde-ariadne: the file manager, which picks files for other programs too'
  'xorg-xwayland: X11 programs'
  'networkmanager: networks and Wi-Fi in the bar and the settings'
  'bluez: Bluetooth in the bar and the settings'
  'upower: the battery, and suspending sooner on it'
  'power-profiles-daemon: the power mode'
  'pipewire-pulse: sound, with its volume in the bar'
  'gnome-keyring: remembering the passphrases of SSH keys'
  'fprintd: unlocking the screen with a finger'
  'brightnessctl: the keyboard light keys, where the keyboard does not change it itself'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
# Built by the release workflow of the sources' repository, from the tag.
source=("$_pkgname-$pkgver-x86_64.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64.tar.zst")
noextract=("$_pkgname-$pkgver-x86_64.tar.zst")
sha256sums=('bf5d70fc08c5ab218c8048ea68af1f2dbba9cd5aa8d1e0e0376ebe95fc1d476f')

package() {
  bsdtar -xf "$_pkgname-$pkgver-x86_64.tar.zst" -C "$pkgdir"
}
