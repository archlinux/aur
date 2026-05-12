# Maintainer: markart25 <139384872+markart25@users.noreply.github.com>
pkgname=mste
pkgver=0.4.0
pkgrel=1
pkgdesc="a small nano-like terminal text editor in Python"
arch=('any')
url="https://github.com/markart25/mste"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/markart25/mste/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f424feeac8c2a060cea5aafabe61c9e5121f5b299b83871da708c755a25b2f34')

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