# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=itango
pkgname=python-$_name
pkgver=0.1.9
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=('any')
url='https://gitlab.com/tango-controls/itango'
license=('LGPL')
depends=(python-pytango python-qtconsole)
makedepends=(python-setuptools)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('51d13c51fb5205037acd959674dcfab495b8043c87ab1ae4f0b8cdf05698589b')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
