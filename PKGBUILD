# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyqt5-chart
pkgver=5.15.7
pkgrel=5
pkgdesc='Python bindings for QtCharts'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtchart/intro'
license=(GPL3)
depends=(qt5-charts python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtchart)
provides=(python-pyqtchart)
replaces=(python-pyqtchart)
source=(https://pypi.python.org/packages/source/P/PyQtChart/PyQtChart-$pkgver.tar.gz)
sha256sums=('bc9f1d26c725e820b0fff8db6e906e8b286128a14b3a98c59a0cd0c3d9924095')

build() {
  cd PyQtChart-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python
  cd build
  make
}

package_python-pyqt5-chart(){
  cd PyQtChart-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
