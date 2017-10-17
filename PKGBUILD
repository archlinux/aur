# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=orphan-reaper
pkgver=2.3
pkgrel=1
pkgdesc="Place subreapers in your process tree to keep it structured"
arch=(i686 x86_64)
url="https://github.com/maandree/orphan-reaper"
license=('custom:ISC')
depends=('linux>=3.4')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(5916c0bb0b90bcf4bd99f273c9a5abd33714e870aeff0be793635d26f1089886)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/orphan-reaper
}


check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr LIBEXEC=/lib/orphan-reaper install DESTDIR="$pkgdir"
}
