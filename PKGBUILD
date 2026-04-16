# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pybvrf
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Python package for working with BrainVision Recording Format (BVRF) files"
arch=('any')
url="https://github.com/cbrnr/pybvrf"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-mne'
    'python-numpy'
    'python-jsonschema'
)
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('dab55e55bcd0e6fd816f5963a6fb87affc46f9ab80de839e9198e6e8c0ddbd03')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
