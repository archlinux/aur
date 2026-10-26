# Maintainer: omgold@aur
# Contributor: enihcam <enihcam@archlinux.us>

pkgname=python-bm25s
pkgver=0.3.15
pkgrel=1
pkgdesc="Highly efficient implementation of BM25"
arch=('any')
url="https://github.com/xhluca/bm25s.git"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pyproject-metadata' )
depends=('python-numpy' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/bm25s/bm25s-$pkgver.tar.gz")
sha256sums=('d97d2f00af4d9f8ef803a1fac7c3cc11d0a4e06f143f9de2d207bdf856d27e6e')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
