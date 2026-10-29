# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-polyline"
_name="${pkgname#python-}"
pkgver=2.0.4
pkgrel=2
pkgdesc="A Python implementation of Google's Encoded Polyline Algorithm Format"
arch=(any)
url="https://github.com/frederickjansen/polyline"
license=('MIT')
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('e7345af16ac376a1af909efc259434730f55e3c2f962d82ee24e6858018c86aa770887ac1db1012ad7ea93e93ec648c9f54540cf280eac5ada26951d353651d6')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
