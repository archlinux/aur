# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=matlab-engine-for-python
pkgname=python-matlabengine
pkgver=9.13.5
pkgrel=1
pkgdesc='A module to call MATLAB from Python'
arch=(x86_64)
url='https://github.com/mathworks/matlab-engine-for-python'
license=('MIT')
depends=(matlab python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('5f93aefb9cc06fc86cd7fcb09d7c6ae0529602d8db69cfa4b4cc45a935eb8937377f5c875acd134bf401897a0b49b628763d5937d6273e9404e0bc3d0af84927')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
