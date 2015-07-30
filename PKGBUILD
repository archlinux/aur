# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname="dspdfviewer"
pkgver=1.12
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'poppler-qt4')
makedepends=('cmake' 'boost')
conflicts=('dspdfviewer-git')
source=("https://github.com/dannyedel/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('2abb8689b4c67aad5ab73bf7e0ff1e36')
sha256sums=('915a0bc489f12d0c02122e1a98155e39d3489d204207ecd15d74d9327a56d8cf')

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
