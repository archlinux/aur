# $Id$
# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=4.14.0
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('5a954924d6e0c4a010e0bd4a5802f88bedbed9fe4e7145dff1d7da32fde80efa')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python setup.py build
}

package_python-pysimplegui() {
  depends=('python' 'tk')
  cd ${_module}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
