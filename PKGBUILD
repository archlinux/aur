# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-display-text
_pypi_pkgname=adafruit-circuitpython-display-text
pkgver=3.0.6
pkgrel=0
pkgdesc="Displays text using CircuitPython's displayio"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_Display_Text"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python-adafruit-blinka-displayio'
'python-adafruit-circuitpython-bitmap-font'
)
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('72f7802bf2c12a130baa6d6081f9d7e8b7eb0547adc584b7ac78824a04d8bcc4')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
