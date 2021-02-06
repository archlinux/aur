# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-framebuf
_pypi_pkgname=adafruit-circuitpython-framebuf
pkgver=1.4.4
pkgrel=0
pkgdesc="CircuitPython frambuf module, based on the Python frambuf module"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_framebuf"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-blinka')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('35efab0df582074e4268d48ee67b0809218ffb38fd7d5d9ee395903a10dee640')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
