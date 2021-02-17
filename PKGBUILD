# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_product_price_list_parent
_name=trytond_product_price_list_parent
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to use price from another price list"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ef6598ac165bc5096bb1515e9a1aeea2c9fdb71d311348f4242b0309abc8b6e0')
sha512sums=('a9d6128a0710710a752e03c4a02dbdfc3058d01114252be2befca9440e387fa6ac98c6172e66d0a2ea2e4e1d7f49c61d2dbd5211cd682f80a3f0cf7740e92bd6')
b2sums=('8afcbc3bf54c6afde3c8babb0583172c0b17eb4f4de937277a3a5bb388828e36571802a67ff33bef7eeb72b7a5fd21de29245ccaa9a6621ec825e3f5b0191da6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
