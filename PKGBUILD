# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=timeprefix
pkgver=3.0.1
pkgrel=1
pkgdesc="Prefix each line with the time it as written"
arch=(i686 x86_64)
url="https://github.com/maandree/timeprefix"
license=('custom:ISC')
depends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4bd9d75f31b7b7f1945607022547913b71563096907e6a5766b7854ac6cdc8bb)

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
