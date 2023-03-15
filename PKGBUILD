# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=connexion
pkgname=python-connexion
pkgver=2.14.2
pkgrel=1
pkgdesc='Design-First framework for Python with support for Swagger/OpenAPI, automatic endpoint validation & OAuth2'
arch=(any)
url="https://github.com/spec-first/connexion"
license=("Apache2")
depends=("python")
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

sha256sums=('6b436b8eb1b2e13a8a5f68918b44d3382a040574c267ced93aa4a61d958ae95a')
