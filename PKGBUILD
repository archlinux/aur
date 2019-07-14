# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_consignment
_name=trytond_stock_consignment
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to manage consignment stock"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6350f9eebce8f37a283c8779b1c05201d96a9a902d226666b5d7471194d70210')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
