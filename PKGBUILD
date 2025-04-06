# Maintainer: Phyo Wai Lin (nureon22) <phyowailin2004.proton.me>

pkgname=gfont
pkgver=0.15.2
pkgrel=1
pkgdesc="Browse and install google fonts from terminal"
arch=("any")
url="https://github.com/nureon22/$pkgname"
license=("MIT")
depends=("python" "python-requests" "python-urllib3")
makedepends=("python-build" "python-hatchling" "python-installer")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nureon22/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("ae4960864f99a88328640b128fb7684d518fd6ea6a4590def52243750834ee1f")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir "$pkgdir" "dist/$pkgname-$pkgver-py3-none-any.whl"
}
