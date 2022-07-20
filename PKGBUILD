# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=metar
pkgver=1.3.4
pkgrel=2
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://codeberg.org/maandree/metar"
license=('custom:ISC')
depends=(sh sed grep curl coreutils python3)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(2fb2f7bd17d3f42614681ad645e91caea55d7ed81024ab36a536dc2783419c70)


build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

