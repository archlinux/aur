# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyqt5-datavisualization
pkgver=5.15.6
pkgrel=5
pkgdesc='Python bindings for QtDataVisualization'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro'
license=(GPL3)
depends=(qt5-datavis3d python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtdatavisualization)
provides=(python-pyqtdatavisualization)
replaces=(python-pyqtdatavisualization)
source=(https://pypi.python.org/packages/source/P/PyQtDataVisualization/PyQtDataVisualization-$pkgver.tar.gz)
sha256sums=('9ed33b20e747bc69e1d619f147bb1625cc00d6ef404dbf076ba13a9ff6f6061d')

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
