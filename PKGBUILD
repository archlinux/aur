# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-tinytuya
_pkgname=tinytuya
pkgver=1.13.1
pkgrel=1
pkgdesc="Python module to interface with Tuya WiFi smart devices"
arch=(x86_64)
url="https://github.com/jasonacox/tinytuya"
license=('MIT')
depends=(python-colorama python-pyaes python-requests)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jasonacox/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('3b1c13b5441c1a7db4e8dc23844302292f11ae6738cfe93b982253be92aa74d4')
validpgpkeys=()

build() {
	cd "$_pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
