#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.15.0
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda)
makedepends=(python-wheel python-setuptools python-installer)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('722dd3179036a84475044f93d29ecf437e81c10a0fdc4b17200f319926be3137')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

