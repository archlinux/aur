# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_lot
_name=trytond_stock_lot
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for lot of products"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('37e28cca8592a53ce7e935c30629bd7f86dba4a8d460d80811fc8bee1b621328')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
