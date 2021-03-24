# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-busdevice
_pypi_pkgname=adafruit-circuitpython-busdevice
pkgver=5.0.6
pkgrel=0
pkgdesc="CircuitPython bus device classes to manage bus sharing"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_BusDevice"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-blinka')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('9bb2934e90a151da8b7d9646b25c2ce0b3fd4853f8ba73e8faffedfd8315eda7')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
