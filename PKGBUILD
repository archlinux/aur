# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=4.60.3
pkgrel=1
pkgdesc='Super-simple to create custom GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('75ec46694dc975c0e46be8c57a774e038433b53095821d67be3b221aca3fd68d')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python setup.py build
}

package() {
  cd ${_module}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
