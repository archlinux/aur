# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=agy-guard
pkgver=3.0.0
pkgrel=1
pkgdesc="Deterministic AI Agent Governance, AST Blast-Radius Scanner & Verification Harness"
arch=('any')
url="https://github.com/zyekhabdul/agy-guard"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03fb1c03f781bd195d7e9dd84d98c05e5c554e6d105d686de06464ba9d3e9198')

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
