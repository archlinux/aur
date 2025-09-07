# Maintainer: Radu Potop <radu at wooptoo dot com>

origname=django-ipware
pkgname=python-django-ipware
pkgver=7.0.1
pkgrel=1
pkgdesc='A Django application to retrieve clients IP address'
arch=(any)
url="https://github.com/un33k/$origname"
license=("MIT")
depends=("python" "python-django" "python-ipware")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a11d83bade679ae1046176df96e5e873fe792932068bdcdd21712493bbae650b')

build() {
    cd "$origname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$origname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
