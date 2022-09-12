# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDG sound themes for the X Desktop Environment"
pkgname=xde-sounds
pkgver=1.1
pkgrel=1.1
arch=('any')
license=('GPL')
url="https://github.com/bbidulock/${pkgname}"
groups=('xde')
depends=('glib2' 'libcanberra')
makedepends=('pkgconfig' 'flite' 'flite-voices' 'sox')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('8c7a648496b89c34d400b743e3268791ba4eea9f134a26704d4a092eae9aca31')

build() {
  cd ${pkgname}-${pkgver}
  ./configure
  make
}

package() {
  make -C ${pkgname}-${pkgver} DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
