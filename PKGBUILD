# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>
pkgname=orphan-reaper
pkgver=2.3.1
pkgrel=1
pkgdesc="Place subreapers in your process tree to keep it structured"
arch=(i686 x86_64)
url="https://github.com/maandree/orphan-reaper"
license=('custom:ISC')
depends=('linux>=3.4')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(825880a7b538d4092e00afe2705a9407f750d72c8663415da3560d91372f691c)

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
