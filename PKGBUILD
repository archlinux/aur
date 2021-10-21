# Mantainer: sgar < swhaat at github >

pkgname=python-aioesphomeapi
pkgver=10.0.3
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
sha256sums=('b8cae52ba45c5e59763d724405f0cd408f0925bbb36cd65c4eb65bba13411d02')

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

