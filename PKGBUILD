# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=agy-guard
pkgver=3.0.1
pkgrel=1
pkgdesc="Deterministic AI Agent Governance, AST Blast-Radius Scanner & Verification Harness"
arch=('any')
url="https://github.com/zyekhabdul/agy-guard"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('35d2c7eba733d9ce2ddd92a61335421410abdc8bcf5316e8f304d219519f9225')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
