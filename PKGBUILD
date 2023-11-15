# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=18.4.0
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
sha256sums=('8070d2a98851280760fd6e9a4c4884fd9afa7bc300481ccc089ee687ea473468')

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
