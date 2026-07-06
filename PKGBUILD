# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mnextend
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=1
pkgdesc="Additional functionality for MNE-Python"
arch=('any')
url="https://github.com/cbrnr/mnextend"
license=('BSD-3-Clause')
depends=(
    'python'
    'python-edfio'
    'python-matplotlib'
    'python-mne'
    'python-numpy'
    'python-onnx'
    'python-pybv'
    'python-pybvrf'
    'python-pyxdf'
    'python-scipy'
)
makedepends=('python-build' 'python-installer' 'python-uv-build')
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('820110918a416a0909da9170189bacc2c2243bcbb1e4704c8ec3e71ea8f2d279')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
