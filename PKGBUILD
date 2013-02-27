# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dmtx-utils
pkgver=0.7.4
pkgrel=1
pkgdesc="Utilities to libdmtx"
url="http://www.libdmtx.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libdmtx' 'imagemagick')
source=("http://downloads.sourceforge.net/libdmtx/${pkgname}-${pkgver}.tar.bz2")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

sha256sums=('9f510f6c26a2a73e44da28eae78308973cc274043873cc7f90606624066ec7d0')
