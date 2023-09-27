pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver='0.10.16'
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(python python-beautifulsoup4 python-chardet python-dataclasses-json python-emoji python-filetype python-lxml python-nltk python-iso639 python-magic python-requests python-tabulate python-transformers python-pytest python-markdown python-pillow python-numpy python-opencv python-httpx python-google-auth python-fsspec python-dateutil python-pandas python-pdfminer)
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('87e56e4276b1ff15ca6bcc1e50062d21c91699fb7f32b1cd6b718f9a92d00985')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
