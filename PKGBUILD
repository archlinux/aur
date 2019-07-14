# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_product
_name=trytond_account_product
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add accounting on product"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a3beb905fcbc310fbf1f7f125cbe9f0caef7981ded0051f48e2d690ca957ff20')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
