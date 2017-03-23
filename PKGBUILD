# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=python-setup_qt
_pkgname=setup_qt
pkgver=1.0.0
pkgrel=1
pkgdesc="Compile Qt resource files, UI files and translations in setup.py"
arch=('any')
url="https://github.com/xmikos/setup_qt"
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('python-setuptools')
optdepends=(
  'python-pyqt5: Qt 5 bindings for Python 3'
  'python-pyqt4: Qt 4 bindings for Python 3'
  'python-pyside2-git: LGPL Qt 5 bindings for Python 3'
  'python-pyside: LGPL Qt 4 bindings for Python 3'
)
source=(https://github.com/xmikos/setup_qt/archive/v$pkgver.tar.gz)
sha256sums=('b7b04ca9dfa2887a3869eb1f754af839bb814a9c8eaf3ba47c8e23ff4d0a48f5')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
