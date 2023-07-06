# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=14.0.0
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
sha256sums=('dd5dcfd59dc38a1c70e9d16e0968b9064520b047572902462548e0c346b1fece')

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
