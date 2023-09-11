# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.5.2
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=('any')
url='https://github.com/pymodbus-dev/pymodbus'
license=('BSD')
source=("v$pkgver.tar.gz::https://github.com/pymodbus-dev/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5af0f350942e836ed96a812093912659e5d5e42f3bace8984222e6834e04b0b3')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
