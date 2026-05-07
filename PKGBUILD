# Maintainer: markart25 <139384872+markart25@users.noreply.github.com>
pkgname=mste
pkgver=0.3.0
pkgrel=1
pkgdesc="a small nano-like terminal text editor in Python"
arch=('any')
url="https://github.com/markart25/mste"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/markart25/mste/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('452675a7412d2150d2b6f0c3b1feb0ecdc761a5a58cc6562c77edc4dbc42f343')

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