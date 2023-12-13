# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=a2wsgi
pkgname=python-a2wsgi
pkgver=1.9.0
pkgrel=1
pkgdesc='Converts WSGI apps to ASGI apps or the other way around'
arch=(any)
url="https://github.com/abersheeran/a2wsgi"
license=("Apache2")
depends=("python")
makedepends=("python-build" "python-installer" "python-pdm-backend")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$_pkgbasename-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbasename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('540d0338f9ff92b16ce75a3fbfe5ae514fa405e4c25ea53354dff67a83663886')
