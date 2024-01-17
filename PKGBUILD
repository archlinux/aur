# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-framebuf
_pypi_pkgname=adafruit-circuitpython-framebuf
pkgver=1.6.5
pkgrel=0
pkgdesc="CircuitPython frambuf module, based on the Python frambuf module"
arch=('any')
url="https://github.com/adafruit/Adafruit_CircuitPython_framebuf"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python'
'python-adafruit-blinka'
)
optdepends=('python-rpi-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('d0c71d123606a8ef18f0e1093bee28b93a70fa0baf2461c86ce644f09c8d3272')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
