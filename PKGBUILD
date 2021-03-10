# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-networkauth
pkgname=(python-pyqt5-networkauth)
pkgver=5.15.4
pkgrel=1
pkgdesc="Python bindings for QtNetworkAuth"
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtnetworkauth/intro"
license=(GPL3)
groups=(pyqt5)
depends=(qt5-networkauth python-pyqt5)
makedepends=(sip pyqt-builder)
source=("https://pypi.python.org/packages/source/P/PyQtNetworkAuth/PyQtNetworkAuth-$pkgver.tar.gz")
sha256sums=('893b9f8afb26a64757e9fa3436261b8bfcb4e696efc2a364a9dc8ac44db67fa7')

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
