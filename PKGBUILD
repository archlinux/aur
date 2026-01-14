#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.24.0
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda python-cuda)
makedepends=(python-wheel python-setuptools python-installer gcc)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5efa470bfdcdc50439f6e205674bcd6e76782d8dd8cbed4b8a881e30e363fbbb')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

