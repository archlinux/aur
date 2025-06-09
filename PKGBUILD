# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-tinytuya
_pkgname=tinytuya
pkgver=1.17.2
pkgrel=1
pkgdesc="Python module to interface with Tuya WiFi smart devices"
arch=(x86_64)
url="https://github.com/jasonacox/tinytuya"
license=('MIT')
depends=(python-colorama python-pyaes python-requests python-cryptography)
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
sha256sums=('7d96718ffa80de2d5132793726ce0802e11ef52e475b8d82826dce31e451ae98')
validpgpkeys=()

build() {
	cd "$_pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
