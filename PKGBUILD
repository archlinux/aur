# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=a2wsgi
pkgname=python-a2wsgi
pkgver=1.10.4
pkgrel=2
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

sha256sums=('0deabd4084ab3539c67e9c41884a681757b936ce924a52b8b59c9a42dc7b0013')

