# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=pdeath
pkgver=1.1
pkgrel=1
pkgdesc="Run a command that is killed when its parent exits"
arch=(i686 x86_64)
url="https://github.com/maandree/pdeath"
license=('custom:ISC')
depends=('linux>=2.1.57')
makedepends=('linux>=2.1.57')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(1b236d9768d972611ca4a41c247a8953028e6f80e637b26e7b1086b10989b3d8)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}
