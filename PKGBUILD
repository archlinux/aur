# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python38-pyqt5-datavisualization
pkgname=(python38-pyqt5-datavisualization)
pkgver=5.15.5
pkgrel=3
pkgdesc='Python 3.8 bindings for QtDataVisualization'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqtdatavisualization/intro'
license=(GPL3)
groups=(pyqt5)
depends=(qt5-datavis3d python38-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python38-pyqtdatavisualization)
provides=(python38-pyqtdatavisualization)
replaces=(python38-pyqtdatavisualization)
source=(https://pypi.python.org/packages/source/P/PyQtDataVisualization/PyQtDataVisualization-$pkgver.tar.gz)
sha256sums=('8927f8f7aa70857ef00c51e3dfbf6f83dd9f3855f416e0d531592761cbb9dc7f')
options=(debug)

build() {
  cd PyQtDataVisualization-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python38
  cd build
  make
}

package_python38-pyqt5-datavisualization(){
  cd PyQtDataVisualization-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
