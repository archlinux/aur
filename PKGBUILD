# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname="dspdfviewer"
pkgver=1.13.1
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'poppler-qt4')
makedepends=('cmake' 'boost')
conflicts=('dspdfviewer-git')
source=("https://github.com/dannyedel/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('aa47ae8b520daaa2963008be7d17f772')
sha256sums=('333588de0316cfdb5821b8484ee55690dfa3c7431b67c126bfdbe9c9cc3e1ed4')

build() {
  cd "${pkgname}-${pkgver}"
  cmake \
    -DCMAKE_INSTALL_PREFIX="/usr/" \
    -DSYSCONFDIR="/etc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DDSPDFVIEWER_VERSION="${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
