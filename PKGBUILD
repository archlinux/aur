# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_company
_name=trytond_company
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with companies and employees"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e95feb964153952e678a205c45082c82f475fccd03ba8221676270f766169eaf')
sha512sums=('c795752356204ea5f6ec5038d2392538844f96d4824132a972bc93b0bcf54a6db588a094c43545a569610f9b11d8712496a6bcbaa507f4be98af449ec1dd5897')
b2sums=('7636fa82d2c3da6f45b6b4775e4e0159b120e6a4a1c6af764d58e9fa78531b5430c59a1465d2bdee3f152a22a14a8b7eb132f83db8f4e4b1926967bf2d89e04e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
