# Mantainer: S garnica < swhaat at github >

pkgname=esphomeyaml
_base=ESPHome
pkgver=1.10.1
pkgrel=1
pkgdesc="Solution for your ESP8266/ESP32 projects with Home Assistant"
url="https://github.com/esphome/ESPHome"
depends=('python-setuptools'
	'python-voluptuous'
	'python-yaml'
	'python-paho-mqtt'
	'python-colorlog'
	'python-tornado'
	'python-protobuf'
	'python-tzlocal'
	'python-pyserial'
	'platformio-git'
	'esptool-git')
license=('MIT')
arch=('any')
source=("https://github.com/esphome/ESPHome/archive/v${pkgver}.tar.gz")
md5sums=('19d511002b9774d10dde60e7ed3b7a94')

build() {
    cd "$srcdir/${_base}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_base}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
    cd "$srcdir/${_base}-${pkgver}"
    cp esphomeyaml/__main__.py esphomeyaml.py
##	 Run tests, takes a while
#    python esphomeyaml.py tests/test1.yaml compile
#    python esphomeyaml.py tests/test2.yaml compile
}

