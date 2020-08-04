# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_price_list_parent
_name=trytond_product_price_list_parent
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module to use price from another price list"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('84853c8dd243a0862850f44cc7ff2367eb32e9e6571586e73f537bf3f50295e4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
