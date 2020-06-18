# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clip
pkgver=0.7
pkgrel=1
pkgdesc='Create charts and diagrams using a CSS-like language'
arch=('x86_64')
url='https://clip-lang.org'
license=('Apache')
depends=('fmt'
         'cairo'
         'fribidi')
makedepends=('cmake' 'freetype2' 'harfbuzz')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asmuth/clip/archive/v${pkgver}.tar.gz")
sha256sums=('f38f455cf3e9201614ac71d8a871e4ff94a6e4cf461fd5bf81bdf457ba2e6b3e')

build() {
  cd "${pkgname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: