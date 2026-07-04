# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-chunking
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG chunking package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-graphrag-common' 'python-pydantic' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-chunking/graphrag-chunking-3.1.0.tar.gz")
sha256sums=('c7cf0168dcc24287806c3b8f2e7d39ba64eae2a82b4d0d9ed8ca15bd5d73a5c3')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
