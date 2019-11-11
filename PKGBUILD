# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-pcd8544
_pypi_pkgname=adafruit-circuitpython-pcd8544
pkgver=1.1.1
pkgrel=0
pkgdesc="CircuitPython display control library for Nokia PCD8544 monochrome displays"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_PCD8544"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-circuitpython-busdevice')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('f1e4851420a62f0365c17ed1d1114e4a30b8201902a4284462e992f66b8b080f')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
