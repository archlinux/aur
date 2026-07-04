# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-graphrag
pkgver=3.1.0
pkgrel=1
pkgdesc="GraphRAG: A modular graph-based RAG system"
arch=('any')
url="https://github.com/microsoft/graphrag"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' )
depends=('python-azure-identity' 'python-azure-search-documents' 'python-azure-storage-blob' 'python-blis' 'python-devtools' 'python-graphrag-cache' 'python-graphrag-chunking' 'python-graphrag-common' 'python-graphrag-input' 'python-graphrag-llm' 'python-graphrag-storage' 'python-graphrag-vectors' 'python-graspologic-native' 'python-json-repair' 'python-networkx' 'python-nltk' 'python-numpy' 'python-pandas' 'python-pyarrow' 'python-pydantic' 'python-spacy' 'python-textblob' 'python-tqdm' 'python-typer' 'python-typing-extensions' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/graphrag/graphrag-3.1.0.tar.gz")
sha256sums=('a458f9403bf982b4620d751e974d9f37936e047aa054a508f4338950b0eed20d')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
