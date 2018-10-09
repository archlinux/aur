# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui27
pkgname=('python-pysimplegui27')
pkgver=1.1.2
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI27/PySimpleGUI27-${pkgver}.tar.gz)
sha256sums=('57c99b7848804abf12706b8a8d5eae317bbfa0fb2f035b39baa85d70075da43b')

build() {
  cd "$srcdir"/PySimpleGUI27-$pkgver
  python2 setup.py build
}
 
package_python-pysimplegui27() {
  depends=('python2' 'tk')
  cd PySimpleGUI27-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
