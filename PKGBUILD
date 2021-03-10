# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-chart
pkgname=(python-pyqt5-chart)
pkgver=5.15.4
pkgrel=1
pkgdesc="Python bindings for QtCharts"
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtchart/intro"
license=(GPL3)
groups=(pyqt5)
depends=(qt5-charts python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqtchart)
provides=(python-pyqtchart)
replaces=(python-pyqtchart)
source=("https://pypi.python.org/packages/source/P/PyQtChart/PyQtChart-$pkgver.tar.gz")
sha256sums=('e47750632851e105eabc27fdfa8180989d120b822181e512f6643b3c5c4d8074')

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
