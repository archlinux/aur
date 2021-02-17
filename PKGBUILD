# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_split
_name=trytond_stock_split
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to split stock move"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02ed02c14ab1e7673d3cef6d3a9d09c826b71b330aa7f44897f69ff283f40b04')
sha512sums=('4f990310ac9172f4691cf070fc36e7109fc799b884d1ce0001d886b2fa9909ccf46fb3b59f1c032d4db327468d021bc665636ef782db6b52a67f64cfa64f96f3')
b2sums=('18c847f11428b2909d01f7ad0273216c93388d44fe15c712124a090c70d86b4e38b768cbe5d338720123188307578da5702b7e7697faae73757d27beacb0075a')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
