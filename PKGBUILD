# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-bm25s
pkgver=0.3.9
pkgrel=1
pkgdesc="Highly efficient implementation of BM25"
arch=('any')
url="https://github.com/tegusi/bm25s"
license=('BSD')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pyproject-metadata' )
depends=('python-numpy' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/bm25s/bm25s-0.3.9.tar.gz")
sha256sums=('895c679d952b7de8355edb5f3e1a620a1e2f294d1d42b919bf0821cce2e2f597')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
