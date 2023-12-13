# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=connexion
pkgname=python-connexion
pkgver=3.0.5
pkgrel=1
pkgdesc="Connexion is a modern Python web framework that makes spec-first and api-first development easy"
arch=(any)
url="https://github.com/spec-first/connexion"
license=("Apache2")
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
makedepends=("python-build" "python-installer")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd "$_pkgbasename-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbasename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('aa00748e365c327f37e2aedcecf1f82b40b0c7ccd9d8c7930286cc594a42636c')
