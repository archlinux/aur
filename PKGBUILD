# Maintainer: Husam Bilal <husam212@gmail.com>

pkgname="gnome-backgrounds-bitday-git"
_pkgname="gnome-backgrounds-bitday"
pkgver=r13.07526a1
pkgrel=1
pkgdesc="Beautiful dynamic pixel wallpaper for GNOME"
url="https://github.com/ghisvail/gnome-backgrounds-bitday"
makedepends=("git" "make")
provides=("gnome-backgrounds-bitday")
license=("UNLICENSE")
arch=("any")
source=("git+https://github.com/ghisvail/${_pkgname}.git")
md5sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
