# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui27
pkgname=('python-pysimplegui27')
_module='PySimpleGUI27'
pkgver=1.15.0
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python2-setuptools' 'python2-future')
checkdepends=('python2-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI27/PySimpleGUI27-${pkgver}.tar.gz)
sha256sums=('1dc9e0d944ae47766eac3ff9ffcfd2c4f36fee34a7f012aa4126a4f2f83cd6ab')

build() {
  cd "$srcdir"/${_module}-$pkgver
  python2 setup.py build
}
 
package_python-pysimplegui27() {
  depends=('python2' 'tk')
  cd ${_module}-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 
}
# vim:set ts=2 sw=2 et:
