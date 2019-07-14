# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_lot
_name=trytond_stock_lot
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for lot of products"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1b324a4a8aaae21c260983b73d11f80a71cca2a48527c153bede1cc2351ea241')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
