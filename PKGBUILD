# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=9.1.0
pkgrel=2
pkgdesc="Python Client for ESPHome native API. Used by Home Assistant."
url="https://github.com/esphome/ESPHome"
depends=('python-setuptools'
	'python-protobuf'
	'python-zeroconf'
	'python-noiseprotocol-git')
license=('MIT')
arch=('any')
source=("https://github.com/esphome/aioesphomeapi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d8ce43d3625df0c231235730964dd76fb7602e8c419a488ce4ebf301684ae79')

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

