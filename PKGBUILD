# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-connexion
_name=${pkgname#python-}
pkgver=3.4.0.dev1
pkgrel=1
pkgdesc="Connexion is a modern Python web framework that makes spec-first and api-first development easy"
arch=(any)
url="https://github.com/spec-first/$_name"
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
sha256sums=('18ae3316e238fd2cdec6348ec9e1d176a057b74ba84550286bc3d23e2b6fc84c')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
