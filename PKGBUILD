# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgname=xtest
pkgver=2.1.3
pkgrel=1
pkgdesc="Variant of test(1) that can test multiple files from cmdline or stdin"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/xtest"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1ab1ee1bf16ffde5ab2ac917f63cc6985ae3442029f46d7b5cb08f08a5d88914)

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
