# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=a2wsgi
pkgname=python-a2wsgi
pkgver=1.10.10
pkgrel=1
pkgdesc='Converts WSGI apps to ASGI apps or the other way around'
arch=(any)
url="https://github.com/abersheeran/$upstream_name"
license=("Apache-2.0")
depends=("python")
makedepends=("python-build" "python-installer" "python-pdm-backend")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9b8b5594422ea243b73394a8cf00952e0a8a71e8bdd2fa8db730e6de157281f0')

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
