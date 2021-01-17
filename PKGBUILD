# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_invoice_grouping
_name=trytond_sale_invoice_grouping
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to group sale invoices"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5bd7dd3b05debca24860364881d0a5845468dab11460cb8e8fbef582dac24cc5')
b2sums=('2892dfd6984e248cb312b626d7a3bdd3b6fd85ceeac6a76e733711fe68f89434e27cd66eb28aaa19d9f0ab9b7e3809587df7af3dbbee42aec48f4fea5d499e17')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
