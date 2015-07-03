# Maintainer: Snaipe

pkgname=libcsptr
pkgver=2.0.2
pkgrel=1
pkgdesc="A smart pointers library for the C programming language"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${pkgname}.git"
license=('MIT')
depends=('glibc')
source=("https://github.com/Snaipe/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install
}

md5sums=('0c80d051c2981e217b4f09e094129dcb')
