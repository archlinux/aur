# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pystack
pkgname=python-$_name
pkgver=1.5.1
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
b2sums=('60d73b1a768a56020540af9fc548e71a470af883ea46686b322618b84ed685f13c0e0ea90096ca898e4c9a779cd89b96f646a2860a47495e469c217ed1038210')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
