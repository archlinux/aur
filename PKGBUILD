# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-datavisualization
pkgname=(python-pyqt5-datavisualization)
pkgver=5.15.4
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
sha256sums=('fe5e00193994cccc67215d527884d5503d296ae93d928cf4f60f3748ad4d54fa')

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
