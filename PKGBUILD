# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.5.0
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=('any')
url='https://github.com/pymodbus-dev/pymodbus'
license=('BSD')
source=("v$pkgver.tar.gz::https://github.com/pymodbus-dev/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d05f2fd5a502db09ec4b782835360b09140714f1598de77a7407223f24b130bf')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
