# Maintainer: Husam Bilal <husam212@gmail.com>

pkgname="gnome-backgrounds-bitday-git"
_gitname="gnome-backgrounds-bitday-master"
_pkgname="gnome-backgrounds-bitday"
pkgver=r3.3e18284
pkgrel=1
pkgdesc="Beautiful dynamic pixel wallpaper for GNOME"
url="https://github.com/ghisvail/gnome-backgrounds-bitday"
makedepends=("git" "make")
provides=("gnome-backgrounds-bitday")
license=("UNLICENSE")
arch=("any")
source=("https://github.com/ghisvail/${_pkgname}/archive/master.zip")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir/" install
}
