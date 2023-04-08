# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-datavisualization
pkgname=(python-pyqt5-datavisualization)
pkgver=5.15.5
pkgrel=4
pkgdesc='Python bindings for QtDataVisualization'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro'
license=(GPL3)
groups=(pyqt5)
depends=(qt5-datavis3d python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtdatavisualization)
provides=(python-pyqtdatavisualization)
replaces=(python-pyqtdatavisualization)
source=(https://pypi.python.org/packages/source/P/PyQtDataVisualization/PyQtDataVisualization-$pkgver.tar.gz)
sha256sums=('8927f8f7aa70857ef00c51e3dfbf6f83dd9f3855f416e0d531592761cbb9dc7f')

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
