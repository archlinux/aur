# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=metar
pkgver=1
pkgrel=1
pkgdesc="Trivial, yet fully fledged, weather report"
arch=(any)
url="https://github.com/maandree/metar"
license=('GPL3')
depends=(sh sed curl coreutils python3)
makedepends=()
source=($url/archive/$pkgver.tar.gz)
sha256sums=(6cbc56fcfb1152d4dff08ca8960898f68e408ab2b250fa60b63e94c2315482c8)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

