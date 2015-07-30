# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname="dspdfviewer"
pkgver=1.13
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'poppler-qt4')
makedepends=('cmake' 'boost')
conflicts=('dspdfviewer-git')
source=("https://github.com/dannyedel/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('48dd79ae968a06eb5b58ce8d182eb4b2')
sha256sums=('4bf218014b88a6944dbc2e7c3cc4fa24477cbf62a077a4004c0eea500923319d')

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
