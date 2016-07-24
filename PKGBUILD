# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=desktoggle
pkgver=1.5.2
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
conflicts=("desktoggle-git")
url='https://github.com/rscholer/desktoggle'
license=('GPL3')
depends=('libx11')
makedepends=('asciidoc')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('921a6e387c84bf1456e7fc6e92015c6ae22cca52d05e39164206d4a0013fefae')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
