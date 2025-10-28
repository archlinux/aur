# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-dht
_pypi_pkgname=adafruit_circuitpython_dht
pkgver=4.0.10
pkgrel=1
pkgdesc="CircuitPython support for DHT11 and DHT22 type temperature/humidity devices"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_DHT"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python-adafruit-circuitpython-busdevice'
)
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('a8596fdec62668926c3aadf8cb5886840d2f83a53d444daea47155eacde7117e')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
