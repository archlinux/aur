# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_supply_forecast
_name=trytond_stock_supply_forecast
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to add forecast to supply computation"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('44afc0e7ee1b95ecfa07b4517f2ec9b48710ba1bf1e6e222796ad3ebea5311af')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
