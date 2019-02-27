# Mantainer: S garnica < swhaat at github >

pkgbase=esphomeyaml
pkgname=esphome
pkgver=1.11.1
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
	'python-ifaddr'
	'platformio-git'
	'esptool-git')
license=('MIT')
arch=('any')
replaces=('esphomeyaml')
source=("https://github.com/esphome/ESPHome/archive/v${pkgver}.tar.gz")
md5sums=('4309a8d45855bf7f0726ff8e76b8905d')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

check() {
    cd "$srcdir/${pkgname}-${pkgver}"

##	 Run tests, takes a while
#    cp ${pkgname}/__main__.py ${pkgname}.py
#    python esphomeyaml.py tests/test1.yaml compile
#    python esphomeyaml.py tests/test2.yaml compile
}

