# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pyqt5-3d
pkgver=5.15.7
pkgrel=6
pkgdesc='Python bindings for Qt3D'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/pyqt3d/intro'
license=(GPL3)
depends=(qt5-3d python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqt3d)
provides=(python-pyqt3d)
replaces=(python-pyqt3d)
source=(https://pypi.python.org/packages/source/P/PyQt3D/PyQt3D-$pkgver.tar.gz)
sha256sums=('ea783eb546c7dad2d5eaaf82ea5050dde45255a9842e0a1d7584881e9e25a951')

build() {
  cd PyQt3D-$pkgver
  sip-build \
    --no-make \
    --api-dir /usr/share/qt/qsci/api/python
  cd build
  make
}

package_python-pyqt5-3d(){
  cd PyQt3D-$pkgver/build
  make INSTALL_ROOT="$pkgdir" install
}
