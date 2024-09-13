# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pystack
pkgname=python-$_name
pkgver=1.4.0
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
b2sums=('a8f5c79313dfb7576edae0d5f5cd1763edba33758b3024312e9fce52ae805c2b1efc0616a36a76a2f250496e5e11525479b2f60e46f2850763969a65e0c07e4a')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
