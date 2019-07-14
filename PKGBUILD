# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_customs
_name=trytond_customs
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for customs"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('41e7bccedeeb4a9b9cabc5b26040cf2ea4189791950856edc945efc1e53f7798')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
