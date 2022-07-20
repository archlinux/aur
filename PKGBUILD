# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=file2key
pkgver=3.1.1
pkgrel=1
pkgdesc="A simple command that generates a key from a file and a passphrase"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/file2key"
license=('custom:ISC')
depends=(glibc libkeccak)
makedepends=(make coreutils gcc glibc libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4b3d9ea6b35eab38a76dac7f3560abe95ae271045104d2b96f568931b2b0a8aa)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
