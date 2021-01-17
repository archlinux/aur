# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_invoice_line_standalone
_name=trytond_purchase_invoice_line_standalone
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for standalone invoice line from purchase"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('deb5902f5dda97ec069a8aceb40e298ac3d3660ac475c69f23afa95102f9d0fb')
b2sums=('ad6505c357ff20c07b03331c541916b21e18d90a34ac9eadb20b60c8d0421fe0c5be9ac1cabe09a28bd7711d787db9093a511bae0e82479929fed38194b4c4e8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
