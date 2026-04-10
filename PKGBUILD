# Maintainer: lightjunction <lightjunction.me@gmail.com>
pkgname=dots-hyprland-fork-git
pkgver=1.0
pkgrel=1
pkgdesc='dots-hyprland fork - Hyprland config framework'
arch=(any)
url='https://github.com/LIghtJUNction/dots-hyprland'
license=(MIT)
depends=(
  hyprland
  quickshell
  fish
  starship
)
makedepends=(git)
source=("git+https://github.com/LIghtJUNction/dots-hyprland.git")
sha256sums=('SKIP')

pkgver() {
  cd dots-hyprland
  git describe --tags 2>/dev/null | sed 's/^v//;s/-/./g' || printf "0.0.0"
}

package() {
  cd dots-hyprland
  mkdir -p "$pkgdir/usr/share/dots-hyprland"
  cp -r setup dots/.config dots/.local sdata "$pkgdir/usr/share/dots-hyprland/"
  chmod +x "$pkgdir/usr/share/dots-hyprland/setup"
}
