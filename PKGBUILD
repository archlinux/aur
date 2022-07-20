# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-typing
_pypi_pkgname=adafruit-circuitpython-typing
pkgver=1.7.1
pkgrel=0
pkgdesc="Definitions not in the standard typing module that are needed for type annotation of CircuitPython code"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_CircuitPython_Typing"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('30051d7f2a5eeaed67d72cbae5a627fab7be97f2dede2f47d1385d7d8dee2474')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
