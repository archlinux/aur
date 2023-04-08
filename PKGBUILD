# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-chart
pkgname=(python-pyqt5-chart)
pkgver=5.15.6
pkgrel=2
pkgdesc='Python bindings for QtCharts'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtchart/intro'
license=(GPL3)
groups=(pyqt5)
depends=(qt5-charts python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtchart)
provides=(python-pyqtchart)
replaces=(python-pyqtchart)
source=(https://pypi.python.org/packages/source/P/PyQtChart/PyQtChart-$pkgver.tar.gz)
sha256sums=('2691796fe92a294a617592a5c5c35e785dc91f7759def9eb22da79df63762339')

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
