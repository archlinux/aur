# Maintainer: Andy Botting <andy@andybotting.com>
_name=gspread-dataframe
pkgname="python-$_name"
pkgver=4.0.0
pkgrel=2
pkgdesc='Easy data flow between a Google spreadsheet and a Pandas DataFrame'
arch=(any)
url=https://github.com/robin900/gspread-dataframe
license=(MIT)
makedepends=(python-setuptools)
depends=(python-gspread python-pandas python-six)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://github.com/robin900/$_name/archive/v$pkgver.tar.gz")
sha512sums=('e8faeb25d56825c31c61ccbd482274032bb52849c879eb016dc4926b2ffc09fba13894d351203bb570a79ed0719b42d717a4c7fe897dd64ca21ed5ba77fd6faf')

build() {
  cd $_name-$pkgver
  python setup.py build
}

# Disable tests for now
#check() {
#  cd $_name-$pkgver
#  # Don't run the integration tests
#  > tests/gspread_dataframe_integration.py
#  pytest
#}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
