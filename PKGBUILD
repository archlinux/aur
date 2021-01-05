# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-webengine
pkgname=(python-pyqt5-webengine)
pkgdesc="Python bindings for QtWebEngine"
pkgver=5.15.2
pkgrel=1
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtwebengine/intro"
license=(GPL)
groups=(pyqt5)
depends=(python-pyqt5 qt5-webengine)
makedepends=(sip pyqt-builder)
conflicts=(pyqtwebengine-common python-pyqtwebwengine)
provides=(python-pyqtwebengine)
replaces=(python-pyqtwebengine)
source=("https://pypi.python.org/packages/source/P/PyQtWebEngine/PyQtWebEngine-$pkgver.tar.gz")
sha256sums=('4d72fea774071ce6f76e341a3d2c5d595886c9906a9b9493239c841cce54a634')

build() {
  cd PyQtWebEngine-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python
  cd build
  make
}

package_python-pyqt5-webengine() {
  cd PyQtWebEngine-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
