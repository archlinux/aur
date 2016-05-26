# Maintainer: Simon Dreher <code[at]simon-dreher[dot]de>
pkgname=alacarte-maps
pkgver=0.4.0
pkgrel=1
pkgdesc="An easy to use, fast and flexible tile renderer and server for OSM data."
url="https://alacarte-maps.github.io"
arch=('x86_64' 'i686')
license=('AGPL3')
depends=('cairo>=1.12.0' 'boost>=1.55' 'libpng')
makedepends=('cmake')

source=("https://github.com/alacarte-maps/alacarte/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/alacarte-${pkgver}"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/alacarte-${pkgver}/build"
  make install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
