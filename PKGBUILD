# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=sha3sum
pkgver=1.1.5
pkgrel=2
pkgdesc="Keccak-family checksum calculator, including SHA-3"
arch=(i686 x86_64)
url="https://github.com/maandree/sha3sum"
license=('custom:ISC')
depends=('libkeccak>=1.2')
makedepends=('libkeccak>=1.2' sed)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1a4eef5b09b7f70af1f6970840475d4735a14b4fab21937b9fd104b8606654ce)


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
