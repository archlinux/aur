# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname='python-rq'
pkgver=2.0
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=(any)
license=("BSD")
url="https://github.com/rq/rq"
makedepends=("python-build" "python-installer")
depends=('python' 'python-click' 'python-redis')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$srcdir/$basename-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$basename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


sha256sums=('d9ad23f25e5e8c53198000ae376d84b8f69458344a4e863942a194e96afe93bd')
