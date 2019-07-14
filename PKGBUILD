# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_stock_forecast
_name=trytond_stock_forecast
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module with stock forecasts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('092f233f92b05741e85d55e6fc8b169afb6e47ea27c5ea2f6db23aff828a927f')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
