# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-dht
_pypi_pkgname=adafruit-circuitpython-dht
pkgver=4.0.4
pkgrel=0
pkgdesc="CircuitPython support for DHT11 and DHT22 type temperature/humidity devices"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_DHT"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python' 'python-adafruit-circuitpython-busdevice')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('5004021ed6f1ffbcd1042085a1239133b59d64734bf6250f05b3bb191e1cd7a2')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
