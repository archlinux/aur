# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=metar
pkgver=1.3.3
pkgrel=1
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://github.com/maandree/metar"
license=('GPL3')
depends=(sh sed grep curl coreutils python3)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(e3d705f9eefbae585bb614cb2bc7fe74e14fb8dc760df0dc2ff0e0b3b087d5a0)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

