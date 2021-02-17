# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package_shipping_ups
_name=trytond_stock_package_shipping_ups
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="UPS connector for the Tryton application plateform"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c7c0006bcae97cac1b6d014b1e2047799b44103bea28a9586536a84044439c53')
sha512sums=('2043fac6941da85b7156d8e1a85d72fec7afea9c8a73dfe878d288aa6b7c0799babcccf3f33b24f91c95d08097728639dc1dd55c7c34209ce3aa341c80da32bd')
b2sums=('0cbdb3277d5aed66e0fb453616cbc86fc2975c30898867537a2c40232e37b397a116e38c799db3fabff107f6fe2725fe4a3c7a8d503c99a6bd49717f9e9ce1e2')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
