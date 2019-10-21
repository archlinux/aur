# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=liberror
pkgver=1.0.1
pkgrel=1
pkgdesc="Library for custom errors"
arch=(i686 x86_64)
url="https://github.com/maandree/liberror"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(liberror-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(428d6d03c7cf10e3797c0ad8351c6e3215da9079f3589fdc50e5e08c5b6a51b6)

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
