# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-st7735
_pypi_pkgname=adafruit-circuitpython-st7735
pkgver=1.2.10
pkgrel=0
pkgdesc="CircuitPython library for SSD1306 OLED displays"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_ssd1306"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python'
'python-adafruit-blinka-displayio'
)
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('51e4f2df3b77ae76428fa0f59b35d2cc6673d1dcea649f41e6118bf7bae677e6')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
