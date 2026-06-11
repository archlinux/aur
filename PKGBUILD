# Maintainer: crl <crl18039102576@126.com>

pkgname=python-dask-cuda
_pkgname=dask-cuda
pkgver=26.06.00
pkgrel=1
pkgdesc="Utilities for Dask and CUDA interactions"
url="https://github.com/rapidsai/dask-cuda"
arch=('any')
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
    'a42d1d2895474e62d02fbcb3f5b41a9721dc69f595f1a79402cadbae8d46d0bc'
)


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
