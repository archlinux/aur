pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.16.4
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
sha256sums=('3c3c2912c72ae8832864be1d535e1e73036a642cd7f0ab81668e8af495bd0b87')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
