# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product
_name=trytond_product
pkgver=5.2.1
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with products"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d3a4ae1e5f48bd6202e1973951f573af98d1d967b0b3fa6f77423fdc37cb4b49')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
