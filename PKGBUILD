# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-display-text
_pypi_pkgname=adafruit-circuitpython-display-text
pkgver=3.1.1
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
sha256sums=('2005fdb86ecae32dc119816262c69fb5e76e0de29078a99b20f6a56990e6f452')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
