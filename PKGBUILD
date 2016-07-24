# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=desktoggle
pkgver=1.5.3
pkgrel=1
pkgdesc='Hide all windows and show the desktop.'
arch=('i686' 'x86_64')
conflicts=("desktoggle-git")
url='https://github.com/rscholer/desktoggle'
license=('GPL3')
depends=('libx11')
makedepends=('asciidoc')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fdc3a502d222909ddc801c2415c8b0ed976bb21cffa70bb8628063d912e07309')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
