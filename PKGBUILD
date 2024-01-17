# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=python-bluezero
_pypi_pkgname=bluezero
pkgver=0.8.0
pkgrel=0
pkgdesc="Python library for Bluetooth Low Energy (BLE) on Linux"
arch=(any)
url="https://github.com/ukBaz/python-bluezero"
license=('MIT')
makedepends=('python-setuptools')
depends=('dbus-glib' 'python' 'python-dbus' 'python-gobject')
source=("https://pypi.io/packages/source/b/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('9bd6706ff6b941c3bedd5b64e0447051120ae8eeac458fb65f56cc6730e1e598')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
