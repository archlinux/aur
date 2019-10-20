# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=liberror
pkgver=1.0
pkgrel=2
pkgdesc="Library for custom errors"
arch=(i686 x86_64)
url="https://github.com/maandree/liberror"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(liberror-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(57d8541770d3d8f99afbd181086e1b97286d68353f08823ef3ea35df03cd6796)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  printf '%s\n' 'CC = gcc' >> config.mk
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
