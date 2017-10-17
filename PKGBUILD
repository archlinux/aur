# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=exec-as
pkgver=1.2
pkgrel=1
pkgdesc="A command that lets you start another command with any argv[0]"
arch=(i686 x86_64)
url="https://github.com/maandree/exec-as"
license=('ISC')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(8e88fb15fe64a5807e2e814f9c9d2608cb7873997b59279983c724ff2c3c66b8)

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
