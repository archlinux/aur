# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-pybvrf
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=2
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
sha256sums=('e1978553413b737e1e2f7ac6d4ac73d39ad7d2ba1d8634d00a9f75744eca4c67')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
