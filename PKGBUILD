# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Élie Bouttier <elie+aur@bouttier.eu>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

basename='rq'
pkgname='python-rq'
pkgver=2.3.3
pkgrel=1
pkgdesc="Simple job queues for Python"
arch=(any)
license=("BSD-2-Clause")
url="https://github.com/rq/rq"
makedepends=("python-hatch" "python-installer")
depends=('python' 'python-click' 'python-redis')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$srcdir/$basename-$pkgver"
    hatch build -c -t wheel
}

package() {
    cd "$srcdir/$basename-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


sha256sums=('bb51d5d5854954d1b035fc6cfff07ae067f02ad39748b77dfdd42278a460b282')
