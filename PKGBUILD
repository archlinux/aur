# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname='python-unstructured'
_module='unstructured'
pkgver=0.22.22
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
license=('Apache-2.0')
arch=('any')
url="https://github.com/Unstructured-IO/unstructured"
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e3bbfd7e11d99624e920c1ea5e8e4a5920497a909d4de5d97751eef9af845be8')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends=(
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
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
