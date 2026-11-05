# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-h5io
_name=${pkgname#python-}
pkgver=0.2.6
pkgrel=1
pkgdesc="Python package for saving standard objects to forward-compatible HDF5 files"
arch=('any')
url="https://github.com/h5io/h5io/tree/main"
license=('BSD-3-Clause')
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('16f5736f8c4c9d83701df4483dd6b87aab3a92d9966cd2aabb0abfdbd521a4bd')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
