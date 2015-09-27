# Maintainer: Raphael Scholer <rascholer@gmail.com>
_pkgname=libreoffice-style-elementary
pkgname=${_pkgname}-git
pkgver=0.2.r0.g5a180b2
pkgrel=2
pkgdesc='elementary icons for LibreOffice'
arch=('i686' 'x86_64')
url="https://github.com/shimmerproject/${_pkgname}"
license=('GPL3')
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
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
