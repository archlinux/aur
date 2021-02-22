# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=file2key
pkgver=3
pkgrel=2
pkgdesc="A simple command that generates a key from a file and a passphrase"
arch=(i686 x86_64)
url="https://github.com/maandree/file2key"
license=('custom:ISC')
depends=(glibc libkeccak)
makedepends=(make coreutils gcc glibc libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(018b8b2b44a5781d15f464b85e8787492af816d79f3e7af2561901cd7644812b)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
}
