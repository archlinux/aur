# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-busdevice
_pypi_pkgname=adafruit-circuitpython-busdevice
pkgver=5.2.3
pkgrel=1
pkgdesc="CircuitPython bus device classes to manage bus sharing"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_BusDevice"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=('python' 'python-adafruit-blinka')
optdepends=('python-rpi-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('faa572b613a0732de938ed008402dfb105d91adb5d0096bf2709f46669a94885')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
