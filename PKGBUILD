# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libterminput
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal input parsing library"
arch=(x86_64)
url="https://github.com/maandree/libterminput"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libterminput-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c0dc304e379e43c3893ee189c67c60e19b53b0d3c8edba6719fcf4186d7388a4)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
