# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-cache
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG cache package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-graphrag-common' 'python-graphrag-storage' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-cache/graphrag_cache-3.1.0.tar.gz")
sha256sums=('eb0688e14194562234c354212392dab3a171788603ef5544bbf7bb1580af96a4')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
