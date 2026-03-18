# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pymatreader
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc="Python reader for MATLAB .mat files"
arch=('any')
url="https://pymatreader.readthedocs.io/en/latest/"
license=('BSD-2-Clause')
depends=(
    'python'
    'python-numpy'
    'python-scipy'
    'python-h5py'
    'python-xmltodict'
)
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-regex-commit')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('29a5224705fc5648e84c385b43a0fef2de80a99a8f7e7f7ef60631a94fcab403')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
