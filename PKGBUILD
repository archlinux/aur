# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=django-ipware
pkgname=python-django-ipware
pkgver=5.0.0
pkgrel=3
pkgdesc='A Django application to retrieve clients IP address'
arch=(any)
url="https://github.com/un33k/django-ipware"
license=("MIT")
depends=("python" "python-django")
conflicts=("python-ipware")
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

sha256sums=('2d3579bb3fdf966311167bf490f8183ac48f6b8c05cfc845c3b2af7b9db61bc5')
