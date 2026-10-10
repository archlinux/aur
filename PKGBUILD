# Maintainer: Denis Bolba <https://github.com/Codder13>
pkgname=ai-flow-cli
pkgver=0.13.0
pkgrel=1
pkgdesc="Fast terminal AI for Unix pipelines: wraps pi, omp, claude, codex, copilot, opencode & fx"
arch=('any')
url="https://github.com/Codder13/ai-flow-cli"
license=('MIT')
depends=('python' 'python-rich' 'python-pylatexenc')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Codder13/ai-flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6855c28ca8cd94625cad0fae76e7738c47b6fb0b95f4207ca3fda2a98eb17d7b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
