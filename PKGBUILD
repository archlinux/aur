# Maintainer: wraith <xyznuts@gmail.com/>
pkgname=plasma-visual
_pkgname=plasma
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal fluid plasma field visualization engine rendered with characters and math"
arch=('any')
url="https://github.com/wraithtcc/plasma"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/wraithtcc/plasma/archive/refs/tags/1.0.0.zip")
sha256sums=('SKIP')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
