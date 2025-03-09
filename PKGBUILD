# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: edpibu <git@edgarpierre.fr>
pkgname=python-paho-mqtt-2
pkgver=2.1.0
pkgrel=1
pkgdesc="Python client library for MQTT v5.0, v3.1.1 and v3.1"
arch=('any')
url="https://eclipse.dev/paho/clients/python/"
license=('custom')
depends=('python')
makedepends=('python-hatch' 'python-installer')
provides=('python-paho-mqtt')
conflicts=('python-paho-mqtt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eclipse-paho/paho.mqtt.python/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3602ce9d1ada58b063f2052ff013ff8cdd06d66cef918d5f6d048b6f68ccf049')
validpgpkeys=()

build() {
	ls
	cd "paho.mqtt.python-$pkgver"
	python -m hatch build
}

package() {
	cd "paho.mqtt.python-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
