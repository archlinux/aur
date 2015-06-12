# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Nicolas Quienot <niQo>

pkgname=libgcal
pkgver=0.9.6
pkgrel=3
pkgdesc="ANSI C library that does allow communication with google calendar and contacts"
url="http://code.google.com/p/libgcal/"
arch=('i686' 'x86_64')
options=('!libtool')
depends=('libxml2' 'curl')
license=('GPL')
source=(http://libgcal.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
sha256sums=('3197d76c462438d0a761c47d199e402b9d9f05f86a7f9c304313a79ecc5a1503')

build() {
  cd $srcdir/$pkgname-$pkgver
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
