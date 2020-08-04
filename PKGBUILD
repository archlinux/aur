# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_web_shortener
_name=trytond_web_shortener
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to plug a URL to an action"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0e5d716815bf2357d0403e4333efa393d3fdecd6022fe9b2f675091ab83acb07')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
