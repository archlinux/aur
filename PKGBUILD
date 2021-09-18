# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libsha1
pkgver=1.0.1
pkgrel=1
pkgdesc="SHA-1 and SHA-0 hashing library"
arch=(i686 x86_64)
url="https://github.com/maandree/libsha1"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(libsha1-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(08e9c8396839ed42a82145993558523aff83851d420d5c9307ac873707684be9)

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
