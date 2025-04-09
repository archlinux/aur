# Maintainer: John Oberhauser <j.aur@obez.io>
pkgname=okpanel-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A custom AGS panel for hyprland"
license=('GPL3')
arch=('any')
url="https://github.com/JohnOberhauser/OkPanel"
depends=(
  'aylurs-gtk-shell-git'
  'gvfs'
  'sox'
  'wf-recorder'
  'pipewire-pulse'
  'grim'
  'slurp'
  'networkmanager'
  'wireplumber'
  'bluez'
  'bluez-utils'
  'dart-sass'
  'upower'
  'brightnessctl'
  'ttf-jetbrains-mono-nerd'
)
makedepends=('rsync')
source=("git+$url.git")
sha256sums=("SKIP")

package() {
  cd "${pkgname}"

  install -Dm755 bin/okpanel "$pkgdir/usr/bin/okpanel"
  install -Dm755 bin/okpanel-share "$pkgdir/usr/bin/okpanel-share"

  mkdir -p "$pkgdir/usr/share/okpanel"
  rsync -a --exclude='@girs' --exclude='node_modules' ags/ "$pkgdir/usr/share/okpanel/"
}