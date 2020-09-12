# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-framebuf
_pypi_pkgname=adafruit-circuitpython-framebuf
pkgver=1.4.1
pkgrel=0
pkgdesc="CircuitPython frambuf module, based on the Python frambuf module"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_framebuf"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-blinka')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('637e207760781174cfbaf7c97008c87c5524699f277b5b8403429b49e6887c32')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
