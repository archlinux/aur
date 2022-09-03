# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-circuitpython-pcd8544
_pypi_pkgname=adafruit-circuitpython-pcd8544
pkgver=1.2.12
pkgrel=0
pkgdesc="CircuitPython display control library for Nokia PCD8544 monochrome displays"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_CircuitPython_PCD8544"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-circuitpython-busdevice')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('55b7b03ff3173bb8bc8b008cd99d92741c955cec3e1342b70bb9b68d34ae1641')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
