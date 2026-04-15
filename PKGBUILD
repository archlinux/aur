# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-minilog
pkgver=2.3.1
pkgrel=1
pkgdesc="Minimalistic wrapper for Python logging."
arch=('any')
url="https://github.com/jacebrowning/minilog"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/e3/c9/6d4dc9bcd4b97ed89f482eeec0e6bb025942744689215dc2a4ed50415ea4/minilog-${pkgver}.tar.gz")
sha256sums=('4b602572c3bcdd2d8f00d879f635c0de9e632d5d0307e131c91074be8acf444e')

build() {
    cd "minilog-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "minilog-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
