# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=orphan-reaper
pkgver=2.3.2
pkgrel=1
pkgdesc="Place subreapers in your process tree to keep it structured"
arch=(i686 x86_64)
url="https://github.com/maandree/orphan-reaper"
license=('custom:ISC')
depends=('linux>=3.4')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(cec2cac249eb08226ced8b6152ceed57265bc868d1a9a01574d2d574b3b7c387)

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
  make PREFIX=/usr install DESTDIR="$pkgdir"
}
