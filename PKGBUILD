# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-gatt
_pkgname=gatt
pkgver=0.2.7
pkgrel=3
pkgdesc="Bluetooth GATT SDK for Python helps you implementing and communicating with any Bluetooth Low Energy device that has a GATT profile"
url="https://github.com/getsenic/gatt-python"
arch=('any')
license=('MIT')
depends=('python' 'bluez' 'python-gobject')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('626d9de24a178b6eaff78c31b0bd29f962681da7caf18eb20363f6288d014e3a')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
