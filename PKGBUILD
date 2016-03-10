# Author: Javier Tiá <javier dot tia at gmail dot com>

pkgname=complexity
pkgver=1.10
pkgrel=1
pkgdesc="Measure complexity of C source"
url="http://www.gnu.org/software/complexity/"
license=('GPL')
depends=('autogen')
makedepends=('autoconf' 'automake' 'gcc')
arch=('i686' 'x86_64')
source=("http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6d378a3ef9d68938ada2610ce32f63292677d3b5c427983e8d72702167a22053')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 ft=sh et:
