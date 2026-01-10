# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=connexion
pkgname=python-connexion
pkgver=3.3.0
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
sha256sums=('ee3a9ae364a0af8ecf19064cb5882833aed9378981ca9856b15422a8025bbcf9')

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
