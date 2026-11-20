# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=libgamma
pkgver=0.9
pkgrel=1
pkgdesc="Display server abstraction layer for gamma ramps"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/libgamma"
license=('custom:ISC')
depends=(libxcb libx11 libxxf86vm libdrm)
makedepends=(libxcb libx11 libxxf86vm libdrm pkg-config)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(9af13a6e28ef02d0082319a44b41eb48aa8249ea5a289c5b2902798a2ebd3343)


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

