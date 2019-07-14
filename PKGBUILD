# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_invoice_grouping
_name=trytond_sale_invoice_grouping
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to group sale invoices"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9027ac7be64bed33138753b9ce2a9a52c6519686f9512d82029a1a374ad87e2a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
