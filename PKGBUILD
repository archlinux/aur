# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-st7735r
_pypi_pkgname=adafruit-circuitpython-st7735r
pkgver=1.6.4
pkgrel=0
pkgdesc="displayio driver for ST7735R TFT-LCD displays"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_ST7735R"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python' 'python-adafruit-blinka-displayio')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('d629f22cca51a099f7108ff70feb968dd38bac89ce5c049a2a8f18bde661f39c')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
