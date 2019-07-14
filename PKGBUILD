# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale
_name=trytond_sale
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for sale"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dc9df09fc24b2dfc83bc2df361ad5272974dddbfe003fc5f28dc29b9c27cc114')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
