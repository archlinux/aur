# Maintainer: Raphael Scholer <rascholer@gmail.com>
pkgname=libreoffice-style-elementary
pkgver=0.2
pkgrel=2
pkgdesc='elementary icons for LibreOffice'
arch=('i686' 'x86_64')
url="https://github.com/shimmerproject/${pkgname}"
license=('GPL3')
conflicts=("${pkgname}-git")
makedepends=('zip')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2f7831ac0ddc28966ae6e2ee1832d7355cf57d0cd4c82be657d2aceb9792bd7e')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix="/usr" install
}
# vim:set ts=2 sw=2 et:
