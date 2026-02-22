# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=file2key
pkgver=3.1.2
pkgrel=1
pkgdesc="A simple command that generates a key from a file and a passphrase"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/file2key"
license=('custom:ISC')
depends=(libkeccak)
makedepends=(libkeccak)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(e9b79bdbdbf92be34b031b90708130aa80af14df64261a0eab2b880810b55944)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
