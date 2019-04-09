# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-bluezero
_pypi_pkgname=bluezero
pkgver=0.1.0
pkgrel=0
pkgdesc="Python library for Bluetooth Low Energy (BLE)"
arch=(any)
url="https://github.com/ukBaz/python-bluezero"
license=('MIT')
makedepends=('python-setuptools')
depends=('dbus-glib' 'python' 'python-dbus' 'python-gobject')
source=("https://pypi.io/packages/source/b/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('3821f95f6760034093453a6763b9dbdb9def5fdf59d60e4c2add6d7c788cb0b5')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
