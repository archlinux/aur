
pkgname=python-pyqtdatavisualization
pkgver=5.12
pkgrel=1
pkgdesc="Set of Python bindings for The Qt Company's Qt Data Visualization library"
arch=('x86_64')
url="https://www.riverbankcomputing.com/software/pyqtdatavisualization"
license=('GPL')
depends=('qt5-3d')
makedepends=('sip')
source=("https://www.riverbankcomputing.com/static/Downloads/PyQtDataVisualization/${pkgver}/PyQtDataVisualization_gpl-${pkgver}.tar.gz")
sha256sums=('279f86c70e2447704c5b7358fe2592b36eeaf4ad9d9f95e0e51f734711818777')

build() {
  cd "$srcdir"/PyQtDataVisualization_gpl-$pkgver
  python configure.py --no-sip-files --no-qsci-api --no-stubs
  make
}

package() {
  cd "$srcdir"/PyQtDataVisualization_gpl-$pkgver
  mkdir -p "$pkgdir"/usr/lib/python3.7/site-packages/
  make install INSTALL_ROOT="${pkgdir}" -j1
}

