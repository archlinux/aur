# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase_request
_name=trytond_purchase_request
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module for purchase requests"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1d7408fdb40298ad584c289d2c5fbdada0738ed0565db783b279a0fce5e82197')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
