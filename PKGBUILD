# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=file2key
pkgver=3.1
pkgrel=1
pkgdesc="A simple command that generates a key from a file and a passphrase"
arch=(i686 x86_64)
url="https://github.com/maandree/file2key"
license=('custom:ISC')
depends=(glibc libkeccak)
makedepends=(make coreutils gcc glibc libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ad44f72710232ac88c72a41bb21ea3341f7f5981c7d954f3f3d3c68f23857c8c)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}
