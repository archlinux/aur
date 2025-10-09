# Maintainer: crl <crl18039102576@126.com>

pkgname=python-dask-cuda
_pkgname=dask-cuda
pkgver=25.10.00
pkgrel=1
pkgdesc="Utilities for Dask and CUDA interactions"
url="https://github.com/rapidsai/dask-cuda"
arch=('x86_64')
license=('Apache-2.0')
depends=(
    'python-dask'
    'python-distributed'
    'python-click'
    'python-numpy'
    'python-numba' 
    'python-pandas'
    'python-zict'
    'python-nvidia-ml-py'
)
makedepends=('python-setuptools' 'python-scikit-build-core' 'python-rapids-build-backend' 'python-build' 'python-installer' 'python-wheel')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
)
sha256sums=(
    '54c8c36221e69d5ff44a3b107d487d793a3894c9968620a523f2c108bbf3f212'
)


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
