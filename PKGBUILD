# Maintainer: pluttan <pluttan@example.com>
pkgname=vol
pkgver=2.0.0
pkgrel=1
pkgdesc="Universal build tool with beautiful terminal output"
arch=('x86_64' 'aarch64')
url="https://github.com/pluttan/volumes"
license=('MIT')
depends=('python>=3.11' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pluttan/volumes/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "volumes-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "volumes-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
