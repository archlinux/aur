# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=metar
pkgver=1.2
pkgrel=1
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://github.com/maandree/metar"
license=('GPL3')
depends=(sh sed curl coreutils python3)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(f93c8aa134b815064c017f4ad0c4cd4396a97d2964dac65c8506d5f3cec22403)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

