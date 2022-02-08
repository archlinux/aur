#Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=cutepeaks
_up_pkgname=CutePeaks
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple viewer for Sanger sequencing files"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/${_up_pkgname}"
depends=('qt5-svg' 'hicolor-icon-theme')
source=(https://github.com/labsquare/${_up_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('ad6feada0bf9df60b6582ae095c576256e6a0952bcbaf111fe4b77bd8af4e5d0')

build() {
  cd "${srcdir}/${_up_pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${_up_pkgname}-${pkgver}"
  make INSTALL_ROOT=${pkgdir} install
}
