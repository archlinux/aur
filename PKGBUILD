# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=21.0.1
pkgrel=1
pkgdesc="Python Client for ESPHome native API. Used by Home Assistant."
url="https://github.com/esphome/aioesphomeapi"
depends=('python-setuptools'
    'python-cryptography'
    'python-protobuf'
    'python-zeroconf'
    'python-chacha20poly1305-reuseable'
    'python-noiseprotocol-git')
license=('MIT')
arch=('any')
source=("https://github.com/esphome/aioesphomeapi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85cdcf79d76c89b71c8eff1e0b5b2fe510d60f1e2987d1c3ab8377e2c82b3c4d')

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
