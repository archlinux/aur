# Maintainer: crl <crl18039102576@126.com>

pkgname=python-dask-cuda
_pkgname=dask-cuda
pkgver=25.08.00
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
    'python-pynvml'
)
makedepends=('python-setuptools' 'python-scikit-build-core' 'python-rapids-build-backend' 'python-build' 'python-installer' 'python-wheel')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
)
sha256sums=(
    '6fbe58737c1cd52dff090a1115587a609fbd6f76a1387a11d2d371a45b14ab8f'
)


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
