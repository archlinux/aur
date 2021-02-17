# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_gis
_name=trytond_gis
pkgver=5.8.0
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Adds Geographic Information System support to trytond"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('fbbd17ddf0c17c0231007fda007f73677f0db21b17dd77930ae0ddfd6250b499')
sha512sums=('2bdd50687c4554d344b3108b9318a30769dd2290185bd67aed261064c1e9e35564d028f59efdc518094ec06a34c999d1265f873c412595c825fc1a2bd8b490b4')
b2sums=('1cfec5f6710636f89c7dea42f55d7f3dd0667ca4ac85ffe1c21566dd40c07535852465afc55f1263bd9a7371b993209038fa210bfc2e6fdab9fc308d29b7faac')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
