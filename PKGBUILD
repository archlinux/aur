# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-vectors
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG vectors package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-azure-core' 'python-azure-cosmos' 'python-azure-identity' 'python-azure-search-documents' 'python-graphrag-common' 'python-numpy' 'python-pyarrow' 'python-pydantic' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-vectors/graphrag-vectors-3.1.0.tar.gz")
sha256sums=('28f6d5f450bb8c0a60d883afb115de281711f3fb2a0357add463998a2040d313')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
