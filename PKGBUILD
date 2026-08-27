# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=pystack
pkgname=python-$_name
pkgver=1.7.1
pkgrel=1
pkgdesc='Analysis of the stack of remote python processes'
arch=(any)
url='https://github.com/bloomberg/pystack'
license=('Apache')
depends=(python)
makedepends=(
    cython
    libelf
    'nanobind>=1.8'
    python-pkgconfig
    python-build
    python-installer
    python-scikit-build-core
    python-setuptools
    python-wheel
)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('f1f7b9332f9ccef3bc2ff94c89c020bf6d5fe08a6d29910d5487252452d64f35fa01495ed11842ff350c283e27dc60fada9336f7582c0f78c53268243c231621')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
