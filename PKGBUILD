# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply_day
_name=trytond_stock_supply_day
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module to add supply weekdays"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4b68eda89009a42fb38f8e4f3e9ef27c43015158ffe663beba3c57967106e2b1')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
