# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=pdeath
pkgver=1.1.1
pkgrel=1
pkgdesc="Run a command that is killed when its parent exits"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/pdeath"
license=('custom:ISC')
depends=('linux>=2.1.57')
makedepends=('linux>=2.1.57')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(35b3e0e2497f564cb57bb8c44c38da5e25c7d4784f3893237ddec7c6ad384010)

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

check() {
  cd "$srcdir/$pkgname"
  make check
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
