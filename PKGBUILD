# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=4.34.0
pkgrel=1
pkgdesc='Super-simple to create custom GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('1169d3434137242eca2c95ca13ec21de398990563e8f58a10b581ebd127b13cd')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python setup.py build
}

package_python-pysimplegui() {
  depends=('python' 'tk')
  cd ${_module}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
