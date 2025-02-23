#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.5.0
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda)
makedepends=(python-wheel python-setuptools python-installer)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('24b0ce84376e43a8bf11e44d23c8141e2ba8400daa617b6569507a71d3b59203')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

