pkgbase='python-unstructured'
pkgname=('python-unstructured')
_module='unstructured'
pkgver=0.18.3
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
url="https://github.com/Unstructured-IO/unstructured"
depends=(python
python-beautifulsoup4
python-chardet
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
sha256sums=('f269fdd5a6cd49749b763d4d529275a42ec091a6fd4ad3f3aa0044cd9f3d0012')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
