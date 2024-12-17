pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.16.11
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(python
python-backoff
python-beautifulsoup4
python-chardet
python-dataclasses-json
python-emoji
python-filetype
python-langdetect
python-lxml
python-nltk
python-numpy
python-python-iso639
python-magic
python-rapidfuzz
python-requests
python-tabulate
python-typing_extensions
python-wrapt
)

makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d850a0c0d300605a8baaf7f2a892b63df85dba0c7afaac67057d150b63f5c71c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
