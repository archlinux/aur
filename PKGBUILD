# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_secondary_unit
_name=trytond_stock_secondary_unit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add a secondary unit on stock move"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d439ac53d7b72fde31bffe5e60dd9e8c3bd64fd9baa32c383b069dc018ce0d3e')
b2sums=('da81252f7ec5d4869d0200f6a28057be1add4729c96477e37ce6fc7683514ae7a1cb4893e38eef8042124bf1a825c2a5f7fe1951f9c675ae0c486f55a917fa60')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
