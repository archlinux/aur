# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-common
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG common package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-pydantic' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-common/graphrag_common-3.1.0.tar.gz")
sha256sums=('cb76b46820d7d2443b431be4172a1a4fd485309538a17aade30081d5393b7276')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
