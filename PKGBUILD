# Maintainer: Steffen Jaeckel <arch at jaeckel dot eu>

pkgname=python-qmake2cmake
pkgver=1.0.5
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
source=(https://files.pythonhosted.org/packages/63/58/c66c1dc409af359e9a14115b9c97f0506f1dd0e7e3e410478cd208084f48/qmake2cmake-${pkgver}.tar.gz)
sha256sums=('50e0f5d6fe309fd897b90225f2d776d57e10fced6157d9e177fb7df2af3319d6')

build() {
  cd qmake2cmake-${pkgver}
  python setup.py build
}

package() {
  cd qmake2cmake-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
