# Maintainer: Hugo H <63868236+hhhug000@users.noreply.github.com>

pkgname=mote
pkgver=0.1.0
pkgrel=1
pkgdesc="A tiny terminal text editor"
arch=('any')
url="https://github.com/mote-editor/mote"
license=('Apache-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce22e0b6ec5825c2b7f1f1d2e701aebe8b97d28ba60f94511ba76904ab15d907')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}