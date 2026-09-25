# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
pkgver=1.21.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=(any)
url='https://github.com/clalancette/pycdlib'
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('360615599c4586bb8d5944994e2af831baf0bf8cc49ebc8101c5c6f6903e8fbd170353d1fa21838fda3d65f60b09d16a1eb467cc33f18af9a2a64530ab323cd8')

build() {
    cd "pycdlib-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "pycdlib-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
