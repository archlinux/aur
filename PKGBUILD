# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-tinytuya
_pkgname=tinytuya
pkgver=1.16.3
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
sha256sums=('6f0039e1ab4472c709316472d118fd5632248a1590e50620b07a4a331983e6f3')
validpgpkeys=()

build() {
	cd "$_pkgname-$pkgver"
        python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
