# Maintainer: Radu Potop <radu@wooptoo.com>
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Razer <razer[AT]neuf[DOT]fr>

pkgbase='django-redis'
pkgname='python-django-redis'
pkgver=6.0.0
pkgrel=1
pkgdesc="Full featured redis cache backend for Django"
arch=(any)
license=("BSD-3-Clause")
url="https://github.com/jazzband/django-redis"
makedepends=("python-build" "python-installer" "python-setuptools")
depends=('python' 'python-redis')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3a8f2de7fea9397ee6ea39a9ad4f7f242c1c044e498b7fca1c407f54ffcfd11a')

build() {
    cd "$srcdir/$pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
