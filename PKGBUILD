# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=10.13.0
pkgrel=1
pkgdesc="Python Client for ESPHome native API. Used by Home Assistant."
url="https://github.com/esphome/aioesphomeapi"
depends=('python-setuptools'
	'python-cryptography'
	'python-protobuf'
	'python-zeroconf'
	'python-noiseprotocol-git')
license=('MIT')
arch=('any')
source=("https://github.com/esphome/aioesphomeapi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4403363d5bdec3d757c2ed771b477b97e54934b89f40b158e0af9b76ee2d3286')

prepare() {
    cd "$srcdir/aioesphomeapi-${pkgver}"
	sed -i 's/==.*//' requirements.txt
}

build() {
    cd "$srcdir/aioesphomeapi-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/aioesphomeapi-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

