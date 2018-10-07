# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
pkgver=3.9.0
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('67ff775704320abdff8b8a1749424e77f30dc0c551329629afd0894186b29365')

prepare(){
  cp -a PySimpleGUI-$pkgver{,-py2}
}

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
