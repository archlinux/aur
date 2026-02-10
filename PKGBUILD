pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.18.31
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(
python
python-beautifulsoup4
python-charset-normalizer
python-click
python-emoji
python-filetype
python-langdetect
python-lxml
python-magic
python-nltk
python-numpy
python-python-iso639
python-rapidfuzz
python-regex
python-requests
python-typing_extensions
python-wrapt
)

makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2a736d04964214efb256a4c04fff4e2f7e169301c319328ceb9ca75602c3beee')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
