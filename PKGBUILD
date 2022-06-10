# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=bus
pkgver=3.1.9
pkgrel=1
pkgdesc="A simple daemonless system for broadcasting messages locally"
arch=(i686 x86_64)
url="https://github.com/maandree/bus"
license=('custom:ISC')
depends=()
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(f5c7767d427b628357876c8df15862f83c7676f354c9a38a5e4e004fdf278ab3)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
