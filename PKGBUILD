# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-3d
pkgname=(python-pyqt5-3d)
pkgver=5.15.3
pkgrel=1
pkgdesc="Python bindings for Qt3D"
arch=(x86_64)
url="https://www.riverbankcomputing.com/software/pyqt3d/intro"
license=(GPL3)
groups=(pyqt5)
depends=(qt5-3d python-pyqt5)
makedepends=(sip pyqt-builder)
conflicts=(python-pyqt3d)
provides=(python-pyqt3d)
replaces=(python-pyqt3d)
source=("https://pypi.python.org/packages/source/P/PyQt3D/PyQt3D-$pkgver.tar.gz")
sha256sums=('e624fcc718f16794fdfceb9206dcab8084cf7a5ac650013ee02303bd6cfd6a46')

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
