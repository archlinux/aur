# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=django-ipware
pkgname=python-django-ipware
pkgver=5.0.0
pkgrel=5
pkgdesc='A Django application to retrieve clients IP address'
arch=(any)
url="https://github.com/un33k/$upstream_name"
license=("MIT")
depends=("python" "python-django")
conflicts=("python-ipware")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('2d3579bb3fdf966311167bf490f8183ac48f6b8c05cfc845c3b2af7b9db61bc5')

