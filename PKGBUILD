# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pystack
pkgname=python-$_name
pkgver=1.4.1
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
b2sums=('4ef3bc71055cd3241f9de396c068de6e1003606e8dd053656d7f75550b0af1555481ed8e42dedead34e5f817f07707dd0d9c25d2d67176bc667508e6ae7242d0')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
