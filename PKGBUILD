# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_stock_landed_cost
_name=trytond_account_stock_landed_cost
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for landed cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c89927bc24c0a534e7e4e2874a182f8b6930b82dc22ba68b0517104259204fd4')
b2sums=('d44a8a6200565b44c678d4a3810cfd40b70b828c0acc70b967cb836b96ee3b23dfe44cb7ab715434d62beda9963b82f6082029421c1df32eca82435fd8e8acdb')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
