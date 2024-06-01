# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-tinytuya
_pkgname=tinytuya
pkgver=1.14.0
pkgrel=2
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
sha256sums=('f838f99d9579b11b1d8ef8894d5922d519274f3b7dbc1416b5964b67e399e7f8')
validpgpkeys=()

build() {
	cd "$_pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
