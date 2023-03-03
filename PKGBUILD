# Maintainer: Steffen Jaeckel <arch at jaeckel dot eu>

pkgname=python-qmake2cmake
pkgver=1.0.2
pkgrel=1
pkgdesc="Python scripts to convert QMake projects to CMake projects."
arch=(any)
url=https://code.qt.io/cgit/qt/qmake2cmake.git
license=(GPL3)
depends=(
  'python'
  'python-pyparsing'
  'python-sympy'
  'mypy'
)
makedepends=(
  'python-setuptools'
)
source=(https://files.pythonhosted.org/packages/46/c3/0ad251e972021e4f26d37e378b312eb56649c170ca578c9b45aed8f1c4a1/qmake2cmake-${pkgver}.tar.gz)
sha256sums=('5d6e45a65cb4876f571c0a9f29e1da3805e67c42994239beebeb747c52d999b3')

build() {
  cd qmake2cmake-${pkgver}
  python setup.py build
}

package() {
  cd qmake2cmake-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
