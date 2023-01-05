# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=matlab-engine-for-python
pkgname=python-matlabengine
pkgver=9.13.6
pkgrel=1
pkgdesc='A module to call MATLAB from Python'
arch=(x86_64)
url='https://github.com/mathworks/matlab-engine-for-python'
license=('MIT')
depends=(matlab python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('15638ee6e27a9ea6f98fa008d6973ec504f972137025cdbb50737362493f4aa50ce15208a86c0d7f82dc3b024f12d4a2eb05b947257bed69f1695a3a05ce6653')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
