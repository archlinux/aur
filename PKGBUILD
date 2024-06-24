# Maintainer: Steffen Jaeckel <arch at jaeckel dot eu>

pkgname=python-qmake2cmake
pkgver=1.0.6
pkgrel=1
pkgdesc="Python scripts to convert QMake projects to CMake projects."
arch=(any)
url=https://code.qt.io/cgit/qt/qmake2cmake.git
license=(GPL3)
depends=(
  'python'
  'python-portalocker'
  'python-pyparsing'
  'python-sympy'
  'mypy'
)
makedepends=(
  'python-setuptools'
)
source=(https://files.pythonhosted.org/packages/30/c2/c0fce293cc988ce4cf7f399ae0a0d23c4836e3d9d8410acfb59297ef3f58/qmake2cmake-1.0.6.tar.gz)
sha256sums=('0c6b1b0d19dc76d4bee76f2c4ef84ec4deb67897245798fe3a2b72ecbc3f39d9')

build() {
  cd qmake2cmake-${pkgver}
  python setup.py build
}

package() {
  cd qmake2cmake-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
