# Maintainer: Phyo Wai Lin (nureon22) <phyowailin2004.proton.me>

pkgname=gfont
pkgver=0.14.3
pkgrel=1
pkgdesc="Browse and install google fonts from terminal"
arch=("any")
url="https://github.com/nureon22/$pkgname"
license=("MIT")
depends=("python" "python-requests" "python-urllib3")
makedepends=("python-build" "python-hatchling" "python-installer")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nureon22/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("b6509fd2336143a519135f0c7534ef1f34a19bbdb440976d9498807afb463de9")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python3 -m installer --destdir "$pkgdir" "dist/$pkgname-$pkgver-py3-none-any.whl"
}
