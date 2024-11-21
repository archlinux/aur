# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=webrtc-models
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.0
pkgrel=1
pkgdesc="Python WebRTC models"
arch=('any')
url="https://github.com/home-assistant-libs/python-webrtc-models"
license=("Apache-2.0")
depends=(python-mashumaro python-orjson)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('559c743e5cc3bcc8133be1b6fb5e8492a9ddb17151129c21cbb2e3f2a1166526')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
