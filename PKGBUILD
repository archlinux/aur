# Maintainer: lightjunction <lightjunction.me@gmail.com>
pkgname=dots-hyprland-fork-git
pkgver=1.0
pkgrel=1
pkgdesc='Your fork of dots-hyprland'
arch=(any)
url='https://github.com/LIghtJUNction/dots-hyprland'
license=(MIT)
depends=(
  hyprland
  quickshell
)
makedepends=(git)
source=("git+https://github.com/LIghtJUNction/dots-hyprland.git")
sha256sums=('SKIP')

pkgver() {
  git -C "$srcdir/dots-hyprland" describe --tags 2>/dev/null | sed 's/^v//;s/-/./g' || printf "0.0.0"
}

build() {
  cd dots-hyprland
}

package() {
  cd dots-hyprland
  mkdir -p "$pkgdir/usr/share/dots-hyprland"
  cp -r . "$pkgdir/usr/share/dots-hyprland/"
}
