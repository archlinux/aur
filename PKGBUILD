# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_location_move
_name=trytond_stock_location_move
pkgver=5.8.1
_pkgdir=5.8
pkgrel=1
pkgbase=python-$_name
pkgdesc="Tryton module to move storage locations"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('733ab2e7f277a7fb9af8374ec8c6ee136e0739bfefa69303f3b9fced835844b2')
b2sums=('70fc481b9bcf6db8980df60d77163b4bc9d84ce06d28d3563f89970c651fd896795e1fe5c37fbd7c4133dea7497dd4b7c2db792fe8f268a1341fa25206849be8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
