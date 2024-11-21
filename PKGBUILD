# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=bluetooth-adapters
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.20.2
pkgrel=1
pkgdesc="Tools to enumerate and find Bluetooth Adapters"
arch=('any')
url="https://github.com/bluetooth-devices/bluetooth-adapters"
license=("Apache-2.0")
depends=(python-aiooui python-bleak python-dbus-fast python-uart-devices python-usb-devices)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('88bfba4ab8678c1bb3416851b3e6f497d4b8a368c8de1bc4e517743081ad2f55')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
