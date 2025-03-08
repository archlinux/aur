#  Maintainer: crl <crl18039102576@126.com>

pkgname=python-numba-cuda
_name=numba-cuda
pkgver=0.6.0
pkgrel=1
pkgdesc="The CUDA target for Numba"
url="https://github.com/NVIDIA/numba-cuda"
arch=('x86_64')
license=('BSD-2-Clause')
depends=(python-numba cuda)
makedepends=(python-wheel python-setuptools python-installer)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff160fe3ec60b949616f37a3d4e600c2e03a8694cddc798896b2c3ddc61d335f')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

