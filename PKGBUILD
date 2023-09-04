# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duet
pkgname=python-$_name
pkgver=0.2.8
pkgrel=2
pkgdesc='A simple future-based async library for python.'
arch=(any)
url='https://github.com/google/duet'
license=('Apache')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('420df4bb9d1b1812c11800c6cc55fea556955d9c59bec08dc64f3672aa8b61c6a0ff858dc4b8429b5cbc0ae2d8cc11611c6e1c270cf13042c24d5712c983aa21')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
