# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=4.43.0
pkgrel=1
pkgdesc='Super-simple to create custom GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('eecce0e88d42798d2aa6839c9d4266070b772182bc33908a67500e3789cd42ed')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python setup.py build
}

package() {
  cd ${_module}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
