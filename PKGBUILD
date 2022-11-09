# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=Cirq
pkgname=python-cirq
pkgver=1.0.0
pkgrel=2
pkgdesc='A framework for creating, editing, and invoking Noisy Intermediate Scale Quantum (NISQ) circuits.'
arch=(any)
url='https://github.com/quantumlib/Cirq'
license=('Apache')
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c48a83ccd8d1add6aa87c694cc3585c3ccf18fa6def44ace89f6775c967dcda2152eb1438b131525d0271fdc86177c67544700370783c594166c105b7b3499f1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
