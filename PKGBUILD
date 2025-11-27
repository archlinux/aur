#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.21.1
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda python-cuda)
makedepends=(python-wheel python-setuptools python-installer gcc)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2929f63c7e473f3b422a23fe5c4a5a06f980a3a2419663de5878fac883062b2d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

