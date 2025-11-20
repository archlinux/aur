# Maintainer: Rui Jiang <me@ruijiang.me>
pkgname=python-pdfly
pkgver=0.5.1
pkgrel=1
pkgdesc="Command-line PDF manipulation tool powered by Python"
arch=('any')
url="https://github.com/py-pdf/pdfly"
license=('MIT')
depends=(
    'python-endesive'
    'python-asn1crypto'
    'python-pypdf'
    'python-typer'
    'python-rich'
    'python-fpdf2'
    'python-pillow'
)

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('19dd6b725efa0154c5b5b393e23a26ca36fe85bbf963bbba821524ac0bce5afc')

build() {
    cd "$srcdir/pdfly-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/pdfly-$pkgver"
    python -m installer --destdir "$pkgdir" dist/*.whl
}

