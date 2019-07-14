# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_subscription
_name=trytond_sale_subscription
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for subscription"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('67114f68415c9d011b90f77890a4aff519ba2f99c7c20dcf75c26696ead9fc66')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
