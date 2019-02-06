# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=metar
pkgver=1.3.2
pkgrel=1
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://github.com/maandree/metar"
license=('GPL3')
depends=(sh sed curl coreutils python3)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=(62efb87954332ffc165106c87bcb0d681bdcfe6e665a5a3af79cbf4d76383525)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

