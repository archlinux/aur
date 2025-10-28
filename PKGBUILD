# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-ssd1306
_pypi_pkgname=adafruit-circuitpython-ssd1306
pkgver=2.12.22
pkgrel=1
pkgdesc="CircuitPython library for SSD1306 OLED displays"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_ssd1306"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python'
'python-adafruit-circuitpython-typing'
'python-adafruit-circuitpython-busdevice'
'python-adafruit-circuitpython-framebuf'
)
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('cf8a77541fdef9e5279a5049b23136947961a9a7662ca5a74bec917a86f8ae3a')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
