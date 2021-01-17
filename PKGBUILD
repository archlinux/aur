# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_package
_name=trytond_stock_package
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for stock packaging"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2f97c1857ff4fe994a90322eff50616eefb6a8d5a2dce0349c12a55c01e26b4e')
b2sums=('d96ad5774e923706b96835472c5a5106373c616ab9cbec12361daf669e5061f665d3290dddbadf60e3430795d807de70ac0ece8ac1c24d07a91648287b563370')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
