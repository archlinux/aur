# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_measurements
_name=trytond_product_measurements
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add measurements to product"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3e237fd7c5e5e2e5849dc2df909837c5afc3f64c8e4fb957c7bc217a2b85a0ed')
sha512sums=('861f1e3c5cbfcd332fa05e922fa343a96d20d05dfeaeb0b5bdbd93b9e27654cdcd882020745fbe2578856242f135d7d6467f7f47c3ae13b7d6b209d629823aa0')
b2sums=('5a9a158c32eb087d1124aad8b281225e0d9b9b85282410c6e0e46d75062c753c1af0d19837651c87e30be15c65b3894faed4384d8b2f2b3512ee835a479ae423')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
