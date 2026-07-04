# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-input
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG input package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-graphrag-common' 'python-graphrag-storage' 'python-markitdown' 'python-pyarrow' 'python-pydantic' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-input/graphrag-input-3.1.0.tar.gz")
sha256sums=('a56d92bebe56ead8e907ac13a63a55d1ac14558281c62cd756ac5a2c520e3b58')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
