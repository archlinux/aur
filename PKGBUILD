# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=xtest
pkgver=2.1
pkgrel=1
pkgdesc="Variant of test(1) that can test multiple files from cmdline or stdin"
arch=(i686 x86_64)
url="https://github.com/maandree/xtest"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4dcc9ab25228481b0b69bafc21f392425c18ace052f7e1c13793e5d0c917841a)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
