# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=a2wsgi
pkgname=python-a2wsgi
pkgver=1.10.7
pkgrel=1
pkgdesc='Converts WSGI apps to ASGI apps or the other way around'
arch=(any)
url="https://github.com/abersheeran/$upstream_name"
license=("Apache-2.0")
depends=("python")
makedepends=("python-build" "python-installer" "python-pdm-backend")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('6cebe9ea6f05f06fbe09637a8a074ffe59c63b6a0d8d2153b1fd93531896ba50')
