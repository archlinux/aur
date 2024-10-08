# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=xtest
pkgver=2.1.2
pkgrel=1
pkgdesc="Variant of test(1) that can test multiple files from cmdline or stdin"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/xtest"
license=('ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(0d5ada6ef0bb9044e309a7b1cb6a4a032d778bd29bf9afaede86c79b06961832876ea31dec4ba1511d008a59d9c21dc3cb0a716c9b7794eac292185eeb182fe3)

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
