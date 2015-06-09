# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=libreoffice-style-elementary
pkgname=${_pkgname}-git
pkgver=bffd596
pkgrel=1
pkgdesc='elementary icons for LibreOffice'
arch=('i686' 'x86_64')
url="https://github.com/shimmerproject/${_pkgname}"
license=('GPL')
conflicts=("${_pkgname}")
makedepends=('git' 'zip')
source=("git+${url}")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}"
  make
}

pkgver() {
  cd "${_pkgname}"
  echo "$(git describe --always |sed 's#-#_#g;s#v##')"
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
