# Maintainer: Tunahanyrd <tunahanyrd@gmail.com>
pkgname=hyprvault
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight session manager for Hyprland"
arch=('any')
url="https://github.com/Tunahanyrd/hyprvault"
license=('MIT')
depends=('python>=3.11' 'hyprland')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
