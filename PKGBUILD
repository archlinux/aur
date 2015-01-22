# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=libxdiff
pkgver=0.23
pkgrel=2
pkgdesc="The LibXDiff library implements basic and yet complete functionalities to create file differences/patches"
arch=(i686 x86_64)
url="http://www.xmailserver.org/xdiff-lib.html"
license=('GPL')
source=(http://www.xmailserver.org/$pkgname-$pkgver.tar.gz)
sha256sums=('e9af96174e83c02b13d452a4827bdf47cb579eafd580953a8cd2c98900309124')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
