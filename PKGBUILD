# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duckargs
pkgname=python-duckargs
pkgver=1.5.1
pkgrel=1
pkgdesc="Productivity tool for quickly creating python programs that parse command-line arguments"
arch=(any)
url="https://github.com/eriknyquist/duckargs"
license=('APACHE')
depends=('python>=3.7')
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('499d5547eb45a34a078b23690f7c85993a102854d8c53ab706d2ba60b361abb7f288057bbad5eee723a5e2b5629d2a5f2060591675692244003d0d0cd0624265')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
