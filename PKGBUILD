# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=symbex
pkgname=python-$_name
pkgver=1.3
pkgrel=1
pkgdesc='Find the Python code for specified symbols'
arch=(any)
url='https://github.com/simonw/symbex'
license=('Apache')
depends=('python>=3.8')
makedepends=(python-build python-click python-installer python-setuptools python-wheel)
source=("$url/archive/$pkgver.tar.gz")
b2sums=('949b2e2c9046502ab63b77393a3f1a72fcb05a55b20c2cd2dcbfffb7e286e8024e5174bff80bf547e66346c80478ce337feb4bb3ed632e54e07f08cbf12dc8ea')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
