# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pymatreader
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=2
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
sha256sums=('d9fee72a8436557273a9ad669de3ed5582782467e2289a131396f575862638ff')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
