# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-datavisualization
pkgname=(python-pyqt5-datavisualization)
pkgver=5.15.3
pkgrel=1
pkgdesc="Python bindings for QtDataVisualization"
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro"
license=(GPL3)
groups=(pyqt5)
depends=(qt5-datavis3d python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtdatavisualization)
provides=(python-pyqtdatavisualization)
replaces=(python-pyqtdatavisualization)
source=("https://pypi.python.org/packages/source/P/PyQtDataVisualization/PyQtDataVisualization-$pkgver.tar.gz")
sha256sums=('959bb161c88ce902224591198e0176dfc67b9c0ff43f14902d3b3afb8fe28a97')

build() {
  cd PyQtDataVisualization-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python
  cd build
  make
}

package_python-pyqt5-datavisualization(){
  cd PyQtDataVisualization-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
