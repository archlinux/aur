# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=xtest
pkgver=2
pkgrel=1
pkgdesc="Variant of test(1) that can test multiple files from cmdline or stdin"
arch=(i686 x86_64)
url="https://github.com/maandree/xtest"
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(10a12fab90381bf62135c24634515865de52e0f7e99f3d0f0959dca1ac9b4c99)

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
