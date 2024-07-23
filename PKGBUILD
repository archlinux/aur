# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: Daniel Peukert <daniel@peukert.cc>

pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=4.70.1
pkgrel=1
pkgdesc='Super-simple to create custom GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
depends=('python' 'tk')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('84b2bd09435a41d0a9cfd7ecbb464daa0557174cfd099068524266ed43b3525f')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python setup.py build
}

package() {
  cd ${_module}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
