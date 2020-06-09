# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=liberror
pkgver=1.1
pkgrel=1
pkgdesc="Library for custom errors"
arch=(i686 x86_64)
url="https://github.com/maandree/liberror"
license=('custom:ISC')
depends=()
checkdepends=()
makedepends=()
source=(liberror-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8603ed823a587f4f9af7d286e49dbd4d1f16cadda05853904a4f9e12c3967bfe)

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
