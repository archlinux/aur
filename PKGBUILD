#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.21.2
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda python-cuda)
makedepends=(python-wheel python-setuptools python-installer gcc)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27f6b1d0101565bf285f669b6ba91b99808797ff4d3174ae9a186eab557a8bdf')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

