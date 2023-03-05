# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=duckargs
pkgname=python-duckargs
pkgver=0.1.3
pkgrel=1
pkgdesc="Productivity tool for quickly creating python programs that parse command-line arguments"
arch=(any)
url="https://github.com/eriknyquist/duckargs"
license=('APACHE')
depends=('python>=3.7')
makedepends=(python-build python-installer python-wheel)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('decb9f86f60f82c480469d8d62c8fd5aed660ce2914e6e87e73d6eedb0be7122ccf4f0680682ad72a8c3019849b8ec6891ec20d0eef02c31c8b90a54081f7f22')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
