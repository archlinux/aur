# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=django-axes
pkgname=python-django-axes
pkgver=5.40.1
pkgrel=2
pkgdesc='Keep track of failed login attempts in Django-powered sites'
arch=(any)
url="https://github.com/jazzband/django-axes"
license=("MIT")
depends=("python" "python-django")
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

sha256sums=('cc00b8acc81a3967ef129d2e0987042d0f25e1aa056ae11e91168126d38b3d53')
