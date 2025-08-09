#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.18.1
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda)
makedepends=(python-wheel python-setuptools python-installer)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('09ee788af36dea98a225081f8a8ab0a9f25b71f5938d5eb2881c4f755c4cb5e4')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

