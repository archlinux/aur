# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=chroma-hnswlib
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.7.6
pkgrel=1
pkgdesc="Chroma's fork of hnswlib - a header-only C++/python library for fast approximate nearest neighbors"
arch=("x86_64" "aarch64")
url="https://github.com/chroma-core/hnswlib"
provides=("python-hnswlib")
conflicts=("python-hnswlib")
license=('Apache-2.0')
depends=("python-numpy")
makedepends=('pybind11' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('4dce282543039681160259d29fcde6151cc9106c6461e0485f57cdccd83059b7')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
