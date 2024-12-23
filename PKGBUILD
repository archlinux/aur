# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=dr14_t.meter
pkgname=python-dr14_tmeter
pkgver=1.0.16
pkgrel=2
pkgdesc="Compute the DR14 of a given audio file"
arch=(any)
url="https://github.com/simon-r/$upstream_name"
license=("GPL-3.0-only")
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
conflicts=("dr14_tmeter")
provides=("dr14_tmeter")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/man/man1/"  man/dr14_tmeter.1
}

sha256sums=('73cc55af09879ecc92f911efa25988edfc9de7520efca438e192efd69c5a6372')
