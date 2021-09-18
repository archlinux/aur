# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=pdeath
pkgver=1.1.1
pkgrel=1
pkgdesc="Run a command that is killed when its parent exits"
arch=(i686 x86_64)
url="https://github.com/maandree/pdeath"
license=('custom:ISC')
depends=('linux>=2.1.57')
makedepends=('linux>=2.1.57')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6008ee42559cfa364db478e4d8247203437ab5f455d60f3df1ae9139c6ec7d05)

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
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
