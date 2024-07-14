# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-tinytuya
_pkgname=tinytuya
pkgver=1.15.0
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
sha256sums=('25d7f2b5d29ba441133efcd29b7f20d17318a4225c8427f2429a21e968aa36e6')
validpgpkeys=()

build() {
	cd "$_pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
