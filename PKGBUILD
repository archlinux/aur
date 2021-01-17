# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_measurements
_name=trytond_product_measurements
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to add measurements to product"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3e237fd7c5e5e2e5849dc2df909837c5afc3f64c8e4fb957c7bc217a2b85a0ed')
b2sums=('5a9a158c32eb087d1124aad8b281225e0d9b9b85282410c6e0e46d75062c753c1af0d19837651c87e30be15c65b3894faed4384d8b2f2b3512ee835a479ae423')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
