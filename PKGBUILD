# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pystack
pkgname=python-$_name
pkgver=1.3.0
pkgrel=1
pkgdesc='Analysis of the stack of remote python processes'
arch=(any)
url='https://github.com/bloomberg/pystack'
license=('Apache')
depends=(python)
makedepends=(
    cython
    libelf
    python-pkgconfig
    python-build
    python-installer
    python-setuptools
    python-wheel
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('b05148c629657a634cc113bc7d1c98f48a201dd380f8589f6b63f113f6bc4f7b16594e5325dc84c7bd866b40a19706e8c02093801b7992b483b916ec8a280d56')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
