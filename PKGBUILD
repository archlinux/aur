# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_attendance
_name=trytond_attendance
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module for recording employee attendance"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3750d6f77ec074bdfb8ec7c9bdf7e240f074396f994087ffd9833549c96bc4b0')
b2sums=('a8f9da9540f61b264fa63e59d2e1f9644d2e2bc0a23cfe3ba3dd3b126ef6b44573b13435b3ed25742f9e28a0b026ed9c7b4c2b2d040754695c7b01ef6b9cfc45')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
