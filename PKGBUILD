# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-st7735r
_pypi_pkgname=adafruit-circuitpython-st7735r
pkgver=1.5.12
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
sha256sums=('2eaa9c72e06be2bbd847a69cc00744ae6993746715fdb6d66240bc64e4edc719')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
