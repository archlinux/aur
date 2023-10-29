# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=connexion
pkgname=python-connexion
pkgver=3.0.0a7
pkgrel=2
pkgdesc='Design-First framework for Python with support for Swagger/OpenAPI, automatic endpoint validation & OAuth2'
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

sha256sums=('e743b0bf8f50ed2043d71c1ec384bcefffe946075986883593123ad194e8e24f')
