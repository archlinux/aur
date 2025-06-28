#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.15.2
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda)
makedepends=(python-wheel python-setuptools python-installer)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cec7c178081ea272ed835e98f1991480bdd7ccc15e8720332c737abfed47141b')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

