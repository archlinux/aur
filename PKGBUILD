# Maintainer: Tmplt <tmplt@dragons.rocks>
_pkgname=hhpc
pkgname=hhpc-git
pkgver=v0.3.1.r5.g44e8473
pkgrel=1
pkgdesc="A small utility to hide the mouse pointer with X.org (X11)"
arch=("i686" "x86_64")
url="https://github.com/aktau/${_pkgname}"
license=("BSD")
makedepends=("git" "pkg-config")
depends=("libx11")
conflicts=("hhpc")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}
