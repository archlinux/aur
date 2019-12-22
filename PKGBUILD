# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=python-bluezero
_pypi_pkgname=bluezero
pkgver=0.3.0
pkgrel=0
pkgdesc="Python library for Bluetooth Low Energy (BLE) on Linux"
arch=(any)
url="https://github.com/ukBaz/python-bluezero"
license=('MIT')
makedepends=('python-setuptools')
depends=('dbus-glib' 'python' 'python-dbus' 'python-gobject')
source=("https://pypi.io/packages/source/b/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('7ebe7243169b5c7600941cb6aa31bc3f8b475c22f5ac32a94d2b0200d5faf684')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
