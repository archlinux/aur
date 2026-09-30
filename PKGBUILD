# Maintainer: Denis Bolba <https://github.com/Codder13>
pkgname=ai-flow-cli
pkgver=0.12.1
pkgrel=1
pkgdesc="Fast terminal AI for Unix pipelines: wraps pi, omp, claude, codex, copilot & opencode"
arch=('any')
url="https://github.com/Codder13/ai-flow-cli"
license=('MIT')
depends=('python' 'python-rich' 'python-pylatexenc')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Codder13/ai-flow-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd1f765c445b1768168cba8227d500c93dd2e29d93123a90fcce217f07698043')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
