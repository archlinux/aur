# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_customs
_name=trytond_customs
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=$_name
pkgdesc="Tryton module for customs"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fd87a3c25932aabc6f71586fdca0e5b1a8c0e5efded3503b8c614b130035d49b')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
