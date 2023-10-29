pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver='0.10.27'
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(python python-beautifulsoup4 python-chardet python-dataclasses-json python-emoji python-filetype python-lxml python-nltk python-iso639 python-magic python-requests python-tabulate python-transformers python-pytest python-markdown python-pillow python-numpy python-opencv python-httpx python-google-auth python-fsspec python-dateutil python-pandas python-pdfminer)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b7ae63ebde562a8b3cbe1fbd2b8369114ba27b9abd023179f2ed1aa6da16e80b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
