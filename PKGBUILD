# Maintainer: Radu Potop <radu at wooptoo dot com>

pkgname=python-django-ipware
_name=${pkgname#python-}
pkgver=8.0.0
pkgrel=1
pkgdesc='A Django application to retrieve clients IP address'
arch=(any)
url="https://github.com/un33k/$_name"
license=("MIT")
depends=("python" "python-django" "python-ipware")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('39c722fd977367a916d430880b6fbdf4407533ecfaf43b10d6ec6e32473dddc6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
