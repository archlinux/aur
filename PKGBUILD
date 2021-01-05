# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=pyqt5-3d
pkgname=(python-pyqt5-3d)
pkgver=5.15.2
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
sha256sums=('26128ee8ed1f0344ba50347af4b9e23c0ba87bc3ae25e2e7c6f145e34d223d1f')

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
