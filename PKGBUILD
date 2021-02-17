# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package_shipping
_name=trytond_stock_package_shipping
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="The package shipping module of the Tryton application platform."
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fa47e79e5a690cdba0aee863d3cf79754e5d70f9d6209e20d27f0bb262251788')
sha512sums=('33c65df517155a39646a7025403e4e6af05d05263989d8ae4eaf46fa763412626159cc6f3b55eb7f6325908b79ba90b9f2ce9643e54f4125973c8ee3198938a3')
b2sums=('c8f9042cb0eb8fe8b235007a3047786ce7463da290135bfc92462b5bdf39850d53608af8c351658536965f01c5f8adb46e13c12c4b00242fa710190209923c41')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
