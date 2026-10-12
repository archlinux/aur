# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
pkgver=1.22.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=(any)
url='https://github.com/clalancette/pycdlib'
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('40349ea7ead315f404ae097073c44bd6e516fa119c5ba37bb3824dc97bda52cc35eac876c0a943809b44aec2a819aea9448ca1d12a3fb8078468633e351436ea')

build() {
    cd "pycdlib-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "pycdlib-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
