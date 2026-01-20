pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.18.28
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
sha256sums=('7c7a2c33929c564c19c196a1aa5cd7f44d73ac9410a982df8cf877016e47dd0c')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
