# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-networkauth
pkgname=(python-pyqt5-networkauth)
pkgver=5.15.5
pkgrel=4
pkgdesc="Python bindings for QtNetworkAuth"
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtnetworkauth/intro"
license=(GPL3)
groups=(pyqt5)
depends=(qt5-networkauth python-pyqt5)
makedepends=(sip pyqt-builder)
source=("https://pypi.python.org/packages/source/P/PyQtNetworkAuth/PyQtNetworkAuth-$pkgver.tar.gz")
sha256sums=('2230b6f56f4c9ad2e88bf5ac648e2f3bee9cd757550de0fb98fe0bcb31217b16')

build() {
  cd PyQtNetworkAuth-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python
  cd build
  make
}

package_python-pyqt5-networkauth(){
  cd PyQtNetworkAuth-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
