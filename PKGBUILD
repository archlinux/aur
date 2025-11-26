# Contributor: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-mmcif
_name=mmcif
pkgver=1.0.0
pkgrel=1
pkgdesc="mmCIF Core Access Library"
arch=(x86_64)
url="http://mmcif.wwpdb.org"
license=('Apache')
makedepends=(cmake python-build python-installer python-setuptools)
depends=(python python-requests python-msgpack)
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6d2949c9fb6b93daa2b7ae1c8cca5d433aece1355e010de7c46785d8ec21adba')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
