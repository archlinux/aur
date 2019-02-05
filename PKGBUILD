# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
_module='PySimpleGUI'
pkgver=3.24.0
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('08c428e1df6a1f5dd7f3d5e40aa621ad92f5826cfa478f3ebec153f906fd6bb0')

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
