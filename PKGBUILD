# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
pkgver=3.9.4
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('3c79d6cfa2b66cd0f77e4ee6346736426196482b1d8cb25896a9f3f1a777b36e')

build() {
  cd "$srcdir"/PySimpleGUI-$pkgver
  python setup.py build
}
 
package_python-pysimplegui() {
  depends=('python' 'tk')
  cd PySimpleGUI-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
