# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_split
_name=trytond_stock_split
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to split stock move"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02ed02c14ab1e7673d3cef6d3a9d09c826b71b330aa7f44897f69ff283f40b04')
b2sums=('18c847f11428b2909d01f7ad0273216c93388d44fe15c712124a090c70d86b4e38b768cbe5d338720123188307578da5702b7e7697faae73757d27beacb0075a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
