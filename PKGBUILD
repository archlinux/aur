# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgamma
pkgver=0.7.4
pkgrel=2
pkgdesc="Display server abstraction layer for gamma ramps"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/libgamma"
license=('custom:ISC')
depends=(libxcb libx11 libxxf86vm libdrm)
makedepends=(libxcb libx11 libxxf86vm libdrm pkg-config)
source=(libgamma-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6c15eab2c2d4651cd590d85df3dcbd9657c634c78a7c80aad5f9a9d2561e963a)


prepare () {
  cd "$srcdir/libgamma"
  printf '%s\n' 'CC = cc' >> config.mk
}

build() {
  cd "$srcdir/libgamma"
  make CONFIGFILE=config.mk PREFIX=/usr
}


package() {
  cd "$srcdir/libgamma"
  make CONFIGFILE=config.mk PREFIX=/usr DESTDIR="$pkgdir" install
}

