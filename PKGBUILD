# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python38-pyqt5-webengine
pkgname=(python38-pyqt5-webengine)
pkgdesc="Python bindings for QtWebEngine"
pkgver=5.15.6
pkgrel=1
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqtwebengine/intro"
license=(GPL)
groups=(pyqt5)
depends=(python38-pyqt5 qt5-webengine)
makedepends=(sip pyqt-builder)
conflicts=(pyqtwebengine-common python38-pyqtwebwengine)
provides=(python38-pyqtwebengine)
replaces=(python38-pyqtwebengine)
source=("https://pypi.python.org/packages/source/P/PyQtWebEngine/PyQtWebEngine-$pkgver.tar.gz")
sha256sums=('ae241ef2a61c782939c58b52c2aea53ad99b30f3934c8358d5e0a6ebb3fd0721')
options=(debug)

build() {
  cd PyQtWebEngine-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python38
  cd build
  make
}

package_python38-pyqt5-webengine() {
  cd PyQtWebEngine-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
