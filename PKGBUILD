# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsha2
pkgver=1.0.2
pkgrel=1
pkgdesc="SHA-2-family hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libsha2"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha2-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(61601acb20e1e48161672783b851c12542c812b38b439bdc3615f22fbb2ef755)

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
