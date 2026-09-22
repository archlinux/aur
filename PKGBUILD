# Maintainer: Denis Bolba <https://github.com/Codder13>
pkgname=ai-flow-cli
pkgver=0.11.0
pkgrel=1
pkgdesc="Ultra-fast streaming AI CLI & agent for Unix terminals"
arch=('any')
url="https://github.com/Codder13/ai-flow-cli"
license=('MIT')
depends=('python' 'python-rich' 'python-pylatexenc')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Codder13/ai-flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4292cd8f5e36141a7347e33431491c633725ad5b2549dd8ce65aadb3d57bc62c')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
