# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_sale_subscription
_name=trytond_sale_subscription
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for subscription"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e3db6fce35f6c0a3abd6d31c835913e3632fa3956a53f5131a1c326fd55c4b69')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
