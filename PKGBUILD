# Contributor: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-mmcif
_name=mmcif
pkgver=1.1.0
pkgrel=1
pkgdesc="mmCIF Core Access Library"
arch=(x86_64)
url="https://mmcif.wwpdb.org"
license=('Apache')
makedepends=(cmake python-build python-installer python-setuptools)
depends=(python python-requests python-msgpack)
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ad33f85b581218c3df0e231b2b034244e9f2380d2c8d05244a262a24d30b2f91')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
