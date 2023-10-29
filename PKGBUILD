# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=a2wsgi
pkgname=python-a2wsgi
pkgver=1.8.0
pkgrel=1
pkgdesc='Converts WSGI apps to ASGI apps or the other way around'
arch=(any)
url="https://github.com/abersheeran/a2wsgi"
license=("Apache2")
depends=("python")
makedepends=("python-build" "python-installer")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$_pkgbasename-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgbasename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('3de8a348cb08483dbb4fe42be0672f8540303efd9478230e265555f74f96f3a3')
