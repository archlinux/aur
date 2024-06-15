# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=python-bluezero
_pypi_pkgname=bluezero
pkgver=0.9.0
pkgrel=0
pkgdesc="Python library for Bluetooth Low Energy (BLE) on Linux"
arch=(any)
url="https://github.com/ukBaz/python-bluezero"
license=('MIT')
makedepends=('python-setuptools')
depends=('dbus-glib' 'python' 'python-dbus' 'python-gobject')
source=("https://pypi.io/packages/source/b/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('2512935e094e3afd21ca9d4cb1b9aaa88a524e9538ae81305b2086f09f0eee17')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
