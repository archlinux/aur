# $Id$
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=giflib4
pkgver=4.2.1
pkgrel=1
pkgdesc="A library for reading and writing gif images (version 4)"
url="http://sourceforge.net/projects/giflib/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
source=(http://downloads.sourceforge.net/sourceforge/giflib/giflib-${pkgver}.tar.bz2)
md5sums=('bbd3324af24156d5d7e66ab1cee8508d')

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
