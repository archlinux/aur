# Maintainer: coffebar i8ehkvien@mozmail.com

pkgname=hyprland-per-window-layout
pkgver=1
pkgrel=1
pkgdesc='Per window keyboard layout (language) for Hyprland wayland compositor'
arch=('x86_64')
url="https://github.com/coffebar/$pkgname"
license=('GPL')
makedepends=()
depends=(socat hyprland gojq bash)
_commit=c544dec534
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver(){
  cd "$pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
  cd "$pkgname"
  install -Dm755 hyprland-per-window-xkblayout "$pkgdir"/usr/bin/hyprland-per-window-xkblayout
}
