# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_lot_unit
_name=trytond_stock_lot_unit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to define unit on stock lot"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('57bfad08ca62eaf0fcbd5f8021e30edb0376da0814ffa5566e649e2738d0328a')
b2sums=('4e9603a68a07c8085e926348e730bbd918ffb6f8ec68c277b372decf5365d64cfe6ad62489816562500c7c996bc8bcbce3b40015101059ec2b5bb6997ba26470')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
