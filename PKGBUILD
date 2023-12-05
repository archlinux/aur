pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.11.2
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(python python-backoff python-beautifulsoup4 python-chardet python-dataclasses-json python-emoji python-filetype python-langdetect python-lxml python-nltk python-numpy python-magic python-rapidfuzz python-requests python-tabulate python-typing_extensions python-wrapt)
depends+=(python-transformers python-google-auth python-networkx python-httpx python-langchain python-tqdm python-dateutil python-opencv python-pytest python-pandas python-iso639 python-fsspec python-pikepdf python-markdown python-pillow python-pymongo python-pdfminer)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9472de469c0e46a87dd83c83963eb881260ed9667625942b321c0ed253e3c07')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
