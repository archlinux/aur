# Maintainer: qwence <queen.wenceslas@gmail.com>
# Contributor: noonov <noonov@gmail.com>

pkgname=qdbm
pkgver=1.8.78
pkgrel=1
pkgdesc="A library of routines for managing a database"
arch=('i686' 'x86_64')
url="http://fallabs.com/qdbm/index.html"
license=('LGPL2.1')
depends=('zlib')
source=(http://fallabs.com/qdbm/${pkgname}-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  sed -i "s|@MYOPTS@|${CFLAGS}|" Makefile.in

  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-pthread \
    --enable-zlib
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}

md5sums=('66b3bd69a651316b8d6adc2f21cf3225')

