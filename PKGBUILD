# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-bitmap-font
_pypi_pkgname=adafruit-circuitpython-bitmap_font
pkgver=1.5.6
pkgrel=0
pkgdesc="Loads bitmap fonts into CircuitPython displayio"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_Bitmap_Font"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=()
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('781b31bfbcd42e5b1b817e700844eac2c569e062017597cf83d5dc6da6b00c2f')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
