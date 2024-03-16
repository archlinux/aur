# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-blinka-displayio
_pypi_pkgname=adafruit-blinka-displayio
pkgver=1.2.2
pkgrel=0
pkgdesc="displayio for Blinka"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Blinka"
license=('MIT')
makedepends=('python-setuptools' 'python-pip')
depends=('python-numpy' 'python-adafruit-blinka' 'python-adafruit-circuitpython-typing')
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('3530eb331b399f50b83e70e3c4ed30404ff431cf6529095305671c8b389d7730')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
