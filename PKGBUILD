# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=libbinio
pkgver=1.4
pkgrel=3
pkgdesc="Binary I/O C++ class library"
url="http://libbinio.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2 eof.diff)
install=libbinio.install
md5sums=('517ded8c7ce9b3de0f84b1db74a2ebda'
         '457b5d73e4934adfecf5b75b5f16a227')

prepare() {
  cd "$srcdir/libbinio-$pkgver/src"

  patch -p0 -i "$srcdir/eof.diff"
}

build() {
  cd "$srcdir/libbinio-$pkgver"

  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "$srcdir/libbinio-$pkgver"

  make "DESTDIR=$pkgdir" install
}

# vim:set ts=8 sts=2 sw=2 et:
