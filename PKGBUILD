# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyqt5-networkauth
pkgver=5.15.6
pkgrel=5
pkgdesc="Python bindings for QtNetworkAuth"
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtnetworkauth/intro"
license=(GPL3)
depends=(qt5-networkauth python-pyqt5)
makedepends=(sip pyqt-builder)
source=("https://pypi.python.org/packages/source/P/PyQtNetworkAuth/PyQtNetworkAuth-$pkgver.tar.gz")
sha256sums=('85ada0c82b9787ffd614abff93bd6d9314d6528265f5f1d23a1922ef0cbeecb9')

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
