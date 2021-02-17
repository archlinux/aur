# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_location_move
_name=trytond_stock_location_move
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to move storage locations"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('733ab2e7f277a7fb9af8374ec8c6ee136e0739bfefa69303f3b9fced835844b2')
sha512sums=('801f3db976762ba42ecaaf7c12d826f0064bea3084afcfaabbb46e77ea973064a31def3b7c56e71ea758fcc016cac1b9374b90760bfa7f56aeaf9a858f52005c')
b2sums=('70fc481b9bcf6db8980df60d77163b4bc9d84ce06d28d3563f89970c651fd896795e1fe5c37fbd7c4133dea7497dd4b7c2db792fe8f268a1341fa25206849be8')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
