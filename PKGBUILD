# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_advance_payment
_name=trytond_sale_advance_payment
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for sale advance payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('babe0b8ab06a72f56ab05896ca6c2fbf46f073bdbc896e2c3ec446193246cd6f')
b2sums=('c619eafd1d88bfdacb12b873312ecd61926ec1af5df0a5d0fa733c7e9c55f7c306305b66897c218c07f5ec3c176d31b560c63b2a32c12d3a7687f883f4ac245c')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
