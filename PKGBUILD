# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_lot_sled
_name=trytond_stock_lot_sled
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc=""
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('31e9d09f2b77c8d76f7ef1fcbc3ca5500088589db523de9ed7a2edf9dae93079')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
