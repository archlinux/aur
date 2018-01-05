# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-bluezero
_pypi_pkgname=bluezero
pkgver=0.0.6
pkgrel=1
pkgdesc="Python library for Bluetooth Low Energy (BLE)"
arch=(any)
url="https://github.com/ukBaz/python-bluezero"
license=('MIT')
makedepends=('python-setuptools')
depends=('dbus-glib' 'python' 'python-dbus' 'python-gobject')
optdepends=()
source=("https://pypi.io/packages/source/b/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
md5sums=('c5e6e19d5527792dde402376c679f107')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
