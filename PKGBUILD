# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=libar2
pkgver=1.1
pkgrel=1
pkgdesc="Library for the Argon2-family of hashing functions"
arch=(i686 x86_64)
url="https://github.com/maandree/libar2"
license=('custom:ISC')
depends=(libblake)
checkdepends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(f94e871b6e4b6a23e9019b3ff606836f05eb1ca8ec3eacd466c171cd0f0abd1a)

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
