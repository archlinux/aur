# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-typing
_pypi_pkgname=adafruit-circuitpython-typing
pkgver=1.8.1
pkgrel=0
pkgdesc="Definitions not in the standard typing module that are needed for type annotation of CircuitPython code"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_Typing"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('4f6c736a65f1313168bc77d1b6a1e346fd17cd771bf9b13ee71eef0a1ef0b8e1')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
