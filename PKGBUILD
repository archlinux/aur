# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-display-text
_pypi_pkgname=adafruit-circuitpython-display-text
pkgver=2.22.4
pkgrel=0
pkgdesc="Displays text using CircuitPython's displayio"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_Display_Text"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python-adafruit-blinka-displayio' 'python-adafruit-circuitpython-bitmap-font')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('46b12d98bb418d16028015915d129692280cc725010309172060ae0dddd288c3')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
