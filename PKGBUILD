# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_eu
_name=trytond_account_eu
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for european accounting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ca39c8a5c6c99e31ef8ee36251d5f46e7e428d66c47a17c7ed93f9a5528b3003')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
