# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_split
_name=trytond_stock_split
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to split stock move"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9504edfcbe86f38396a80b55cfe73c09e387636979e13a6862fc9e5291c6ac0e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
