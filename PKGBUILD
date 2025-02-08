# Maintainer: Radu Potop <radu@wooptoo.com>
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Razer <razer[AT]neuf[DOT]fr>

pkgbase='django-redis'
pkgname='python-django-redis'
pkgver=5.4.0
pkgrel=2
pkgdesc="Full featured redis cache backend for Django"
arch=(any)
license=("BSD")
url="https://github.com/jazzband/django-redis"
makedepends=("python-build" "python-installer" "python-setuptools")
depends=('python' 'python-redis')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd "$srcdir/$pkgbase-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgbase-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('118569679bc9f866211b953c7a8108ff548781965554417736bd7c40d0846392')
