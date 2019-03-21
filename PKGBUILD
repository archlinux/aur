# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui27
pkgname=('python-pysimplegui27')
_module='PySimpleGUI27'
pkgver=1.25.0
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI27/PySimpleGUI27-${pkgver}.tar.gz)
sha256sums=('9b39ce3364db764114134d16d4ddef6373a2d6f392eef2b0c6ecc7e8e2482ad8')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python2 setup.py build
}
 
package_python-pysimplegui27() {
  depends=('python2' 'tk' 'python2-future')
  cd ${_module}-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
# vim:set ts=2 sw=2 et:
