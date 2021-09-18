# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=file2key
pkgver=3.1.1
pkgrel=1
pkgdesc="A simple command that generates a key from a file and a passphrase"
arch=(i686 x86_64)
url="https://github.com/maandree/file2key"
license=('custom:ISC')
depends=(glibc libkeccak)
makedepends=(make coreutils gcc glibc libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(26e7eb716b46df4dabedbeecc596c0ae8ecc351be3ed6f1e13883e1c0bfe14e6)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
