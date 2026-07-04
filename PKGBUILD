# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag-llm
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG LLM package"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-azure-identity' 'python-graphrag-cache' 'python-graphrag-common' 'python-jinja' 'python-litellm' 'python-nest-asyncio2' 'python-pydantic' 'python-typing_extensions' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag-llm/graphrag_llm-3.1.0.tar.gz")
sha256sums=('1e0a4117a63b4f59c174c0be6768b967d390a7417b19985e6a4ab63a1e3f6ed6')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
