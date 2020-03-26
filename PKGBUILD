# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=4.18.0
pkgrel=1
pkgdesc='Super-simple to create custom GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('5d627396ca77c9146d21ad44b439c23e675b212eee1cfe56f3dde66c5215604d')

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
