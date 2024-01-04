# Maintainer: Tomasz Zok <tomasz dot zok at gmail dot com>
pkgname=python-mmcif
_name=mmcif
pkgver=0.84
pkgrel=1
pkgdesc="mmCIF Core Access Library"
arch=(x86_64)
url="http://mmcif.wwpdb.org"
license=('Apache')
makedepends=(cmake pybind11 python-build python-installer python-wheel)
depends=(python python-future python-six python-requests python-msgpack)
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1372d48053e4d8b57c2d5331932c51fac7d809a794df8b9342aa6217b9bea15b')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
