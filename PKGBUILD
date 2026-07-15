# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
pkgver=1.16.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=(any)
url='https://github.com/clalancette/pycdlib'
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('4665920ad8ae4df1a2436a8a77158736936c409e124f5409801f7250b0a8bf0a1b219031475e07e9a68cb469361b131a5fdf65191f7ab4a096cbab7e46ec833f')

build() {
    cd "pycdlib-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "pycdlib-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
