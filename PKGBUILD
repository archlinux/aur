# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=python-bluezero
_pypi_pkgname=bluezero
pkgver=0.6.0
pkgrel=1
pkgdesc="Python library for Bluetooth Low Energy (BLE) on Linux"
arch=(any)
url="https://github.com/ukBaz/python-bluezero"
license=('MIT')
makedepends=('python-setuptools')
depends=('dbus-glib' 'python' 'python-dbus' 'python-gobject')
source=("https://pypi.io/packages/source/b/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('d94f0672b1de3ff0040801538143fe9a42c501d8db79bcd183c9e051b8da83bc')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
