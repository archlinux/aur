# Maintainer: zyekhabdul <zyekhabdulqadirjailani@gmail.com>
pkgname=vol3-suite
pkgver=2.0.0
pkgrel=1
pkgdesc="Unified Memory Forensics, eBPF Rootkit Detection, and AI-Driven Incident Triage Suite"
arch=('any')
url="https://github.com/zyekhabdul/volatility3-cyber-suite"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc39ea0116c6f9e5ceb06131a27f13d4cfc664cee30f6c191e0a35c91989b8e2')

build() {
    cd "volatility3-cyber-suite-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "volatility3-cyber-suite-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
