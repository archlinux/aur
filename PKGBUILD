# Maintainer: Radu Potop <radu@wooptoo.com>

_pkgbasename=django-axes
pkgname=python-django-axes
pkgver=8.3.2
pkgrel=1
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

sha256sums=('40c697a86020f866e5086f41142cd9fb6effadd78faa4389468ebfcc9150ed2c')
