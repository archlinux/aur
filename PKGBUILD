# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-st7735r
_pypi_pkgname=adafruit-circuitpython-st7735r
pkgver=1.6.3
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
sha256sums=('77e3d2a2d738125df515f051cdef3af5d116adf1840aad93d58b1f74c2f02959')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
