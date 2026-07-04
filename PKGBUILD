# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-storage
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG storage package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-aiofiles' 'python-azure-cosmos' 'python-azure-identity' 'python-azure-storage-blob' 'python-graphrag-common' 'python-pandas' 'python-pydantic' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-storage/graphrag_storage-3.1.0.tar.gz")
sha256sums=('2f6dcc0625258d6d1cb2b23b74d73bc2e7cbfd6c0c53920b8c253c49d07c6ef5')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
