# $Id$
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=giflib4
pkgver=4.2.3
pkgrel=1
pkgdesc="A library for reading and writing gif images (version 4)"
url="http://sourceforge.net/projects/giflib/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
source=(http://downloads.sourceforge.net/sourceforge/giflib/giflib-${pkgver}.tar.bz2)
md5sums=('be1f5749c24644257a88c9f42429343d')

build() {
  cd giflib-${pkgver}
  ./configure --prefix=/usr --disable-static --includedir=/usr/include/giflib4 --libdir=/usr/lib/giflib4
  make
}

package() {
  cd giflib-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/giflib4/COPYING"
  #rm ${pkgdir}/usr/lib/libgif.so
  rm -f ${pkgdir}/usr/bin/*
}
