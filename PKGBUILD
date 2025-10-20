pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.18.15
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(python
python-beautifulsoup4
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
python-typing_extensions
python-wrapt
)

makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/Unstructured-IO/unstructured/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a8a0f28a00b11a5ca851336cfca918fbdcd020c2a0d1d61df110533b607fa715')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
