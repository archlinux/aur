# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
pkgver=3.10.2
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('0330fcc26185642667930d7479af253d9e360a6d62bad97a265181bfb5335679')

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
