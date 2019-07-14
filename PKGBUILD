# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_purchase
_name=trytond_purchase
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module for purchase"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ccf80dd2902c5b7d9fde20cef36b8d63f43e8db4122f30f0a0619523fcbf6898')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
