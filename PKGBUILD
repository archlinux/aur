# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_stock_landed_cost
_name=trytond_account_stock_landed_cost
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for landed cost"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('29b04fbbd8f6ad44ac56f4c2162e5e65fb74da3defe8735a2395b5b15240e724')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
