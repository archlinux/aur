# $Id$
# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=bison2
PACKAGE=bison
pkgver=2.7.1
pkgrel=1
pkgdesc="The GNU general-purpose parser generator, older version"
arch=('x86_64')
license=('GPL3')
url="http://www.gnu.org/software/bison/bison.html"
depends=('glibc' 'm4' 'sh' 'libiconv')
conflicts=('bison')
groups=('base-devel')
source=(http://ftp.gnu.org/gnu/bison/${PACKAGE}-${pkgver}.tar.gz{,.sig})
md5sums=('f00906151ff9d2cb599cdeae36d902ee'
        'SKIP')
validpgpkeys=('7DF84374B1EE1F9764BBE25D0DDCAA3278D5264E')

build() {
  cd ${srcdir}/${PACKAGE}-${pkgver}  
  ./configure --prefix=/usr/local --datadir=/usr/local/share --mandir=/usr/local/man
  make
}

check() {
  cd ${srcdir}/${PACKAGE}-${pkgver}
  make check
}

package() {
  cd ${srcdir}/${PACKAGE}-${pkgver}
  make DESTDIR=${pkgdir} install
}
