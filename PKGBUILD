# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui27
pkgname=('python-pysimplegui27')
pkgver=1.12.0
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI27/PySimpleGUI27-${pkgver}.tar.gz)
sha256sums=('a00d77c6106d90a04734c2363cdf67672d16543f92e65a8e9c110e3b1ff2f2e2')

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
