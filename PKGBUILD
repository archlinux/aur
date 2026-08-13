# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michael Riegert <michael at eowyn net>

pkgname=python-pycdlib
pkgver=1.20.0
pkgrel=1
pkgdesc='Python library to read and write ISOs'
arch=(any)
url='https://github.com/clalancette/pycdlib'
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8508f0077c4f24bcfb18fff7f371db7b4555543c0e53eff4457b18207589c4a60a1ec9bea66c8faa9ccfe17b6b7ab06ec79f9963ac28f06fd2144e1dc56c085a')

build() {
    cd "pycdlib-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "pycdlib-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
