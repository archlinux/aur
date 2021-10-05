# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=9.1.5
pkgrel=1
pkgdesc="Python Client for ESPHome native API. Used by Home Assistant."
url="https://github.com/esphome/aioesphomeapi"
depends=('python-setuptools'
	'python-protobuf'
	'python-zeroconf'
	'python-noiseprotocol-git')
license=('MIT')
arch=('any')
source=("https://github.com/esphome/aioesphomeapi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8bb417011dd08e478476ce82fa3b4c6920b87407b80ed64af708c6c34e4a8958')

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

