# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_measurements
_name=trytond_product_measurements
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module to add measurements to product"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5a672008529fea7e320c0d344d92f1fc4fd919b2e7daebf46428581cf8f583af')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
