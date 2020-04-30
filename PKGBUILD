# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xde-sounds
pkgver=1.0
pkgrel=1
pkgdesc="XDG sound themes for the X Desktop Environment"
arch=('any')
url="https://github.com/bbidulock/${pkgname}"
license=('GPL')
groups=('xde')
depends=('glib2' 'libcanberra')
makedepends=('pkgconfig' 'flite' 'flite-voices' 'sox')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('1dc371ef6b6a40007c5e54a2c340095abf5c1daf9a181d0e63a2a41d382ea6d9')

build() {
  cd ${pkgname}-${pkgver}
  ./configure
  make
}

package() {
  make -C ${pkgname}-${pkgver} DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
