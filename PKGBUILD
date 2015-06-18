# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tutku Dalmaz <tutkudalmaz@gmail.com>>

pkgname=genchemlab
pkgver=1.0.1
pkgrel=1
pkgdesc="An application intended to simulate common general chemistry laboratory exercises"
arch=('i686' 'x86_64')
#url="http://genchemlab.sourceforge.net/"
url="https://github.com/ids1024/genchemlab/"
license=('GPL')
depends=('qt5-base' 'glu')
source=("https://github.com/ids1024/genchemlab/archive/v${pkgver}.tar.gz"
	"desktop-file.patch")
md5sums=('c67acd494495572c876e807089429dc6'
         'ca2976a9c05e63682293b8137d5f6048')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../desktop-file.patch
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
