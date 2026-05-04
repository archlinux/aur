# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgamma
pkgver=0.8.1
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libgamma"
license=('custom:ISC')
depends=(libxcb libx11 libxxf86vm libdrm)
makedepends=(libxcb libx11 libxxf86vm libdrm pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(166f3de5f6a0665af24417763a7022f3f49f898b5e95f218838b4d79741b36e3)


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

