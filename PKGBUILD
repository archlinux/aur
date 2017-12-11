# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=bus
pkgver=3.1.7
pkgrel=1
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://github.com/maandree/bus"
license=('custom:ISC')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(0f045b016c94e137c44834d37ae59ffef3c91eb6501b3dfbf32468185c86a1c8)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
