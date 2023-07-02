# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=xtest
pkgver=2.1.1
pkgrel=1
pkgdesc="Variant of test(1) that can test multiple files from cmdline or stdin"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/xtest"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(bf8cf7faf5318647894a3cc27694280a12588a0fe7cfcda52a5698cc94f5a833)

build() {
  cd "$srcdir/$pkgname"
  if test -z "$CC"; then
    export CC=cc
  fi
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
