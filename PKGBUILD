# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=home-assistant-bluetooth
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.13.0
pkgrel=1
pkgdesc="Home Assistant Bluetooth Models and Helpers"
arch=('any')
url="https://github.com/home-assistant-libs/home-assistant-bluetooth"
license=("Apache-2.0")
depends=(python-habluetooth)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('3fa8a0d05a844063501a37e0b98501337e7035623b345d5c285a778e9416fd93')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
