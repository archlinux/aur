# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock
_name=trytond_stock
pkgver=5.2.1
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for stock and inventory"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('248d89b02ecf570f4a55b8ca7af07522a510075831d850fafc55ee0bbcd74169')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
