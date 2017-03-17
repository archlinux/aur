# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-qt.py
_pkgname=Qt.py
pkgver=0.6.9
pkgrel=1
pkgdesc="Python compatibility wrapper around all Qt bindings - PySide, PySide2, PyQt4 and PyQt5."
arch=('any')
url="https://github.com/mottosso/Qt.py"
license=('MIT')
depends=('python')
optdepends=(
  'python-pyqt5: Qt 5 bindings for Python 3'
  'python-pyqt4: Qt 4 bindings for Python 3'
  'python-pyside2-git: LGPL Qt 5 bindings for Python 3'
  'python-pyside: LGPL Qt 4 bindings for Python 3'
)
makedepends=('python-setuptools')
source=(https://github.com/mottosso/Qt.py/archive/$pkgver.tar.gz)
sha256sums=('421db39c390b9f6d5978f1ed9a1c16faf4e569aa93c06a95498cd130ea2cfcc6')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
