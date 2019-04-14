# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=liberror-backtrace
pkgver=1.0
pkgrel=1
pkgdesc="Backtrace support for liberror"
arch=(i686 x86_64)
url="https://github.com/maandree/liberror-backtrace"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(liberror-backtrace-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(be929a490e63b214315250d1a57084bdc0af1e3c48bdc198421b4dd1787b1253)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
