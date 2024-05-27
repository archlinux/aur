# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=connexion
pkgname=python-connexion
pkgver=3.1.0
pkgrel=1
pkgdesc="Connexion is a modern Python web framework that makes spec-first and api-first development easy"
arch=(any)
url="https://github.com/spec-first/$upstream_name"
license=("Apache-2.0")
depends=(
    "python"
    "python-a2wsgi"
    "python-asgiref"
    "python-clickclick"
    "python-flask"
    "python-httpx"
    "python-inflection"
    "python-jinja"
    "python-python-multipart"
    "python-requests"
    "python-starlette"
    "python-werkzeug"
)
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('4dab2a0e8259666b057ac6d5bf3ece619c4c88a12c567954f09bbfc0aacd1775')
