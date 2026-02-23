pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.21.2
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
python-numpy
python-python-iso639
python-rapidfuzz
python-regex
python-requests
python-typing_extensions
python-wrapt
)

makedepends=('python-build' 'python-installer' 'python-hatchling')
license=('Apache-2.0')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ccdf94c9eede1015a37c7c9dcdd3ae771b8ed9e4d0c2a0ad922cfaed1ebdf84f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
