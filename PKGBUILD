# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-unstructured
pkgver=0.27.22
pkgrel=1
pkgdesc="A library that prepares raw documents for downstream ML tasks."
license=(Apache-2.0)
arch=(any)
url="https://github.com/Unstructured-IO/unstructured"
depends=(python)
makedepends=(python-build python-installer python-hatchling python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('eba88607999d0f2d15ec6af82b2c065046d78cd8303c217140676980fd9fe2e3')

build() {
    cd "unstructured-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    depends+=(
        python-beautifulsoup4
        python-charset-normalizer
        python-click
        python-emoji
        python-filelock
        python-filetype
        python-langdetect
        python-lxml
        python-magic
        python-numpy
        python-oxmsg
        python-psutil
        python-python-iso639
        python-rapidfuzz
        python-regex
        python-requests
        python-spacy
        python-tqdm
        python-typing_extensions
        python-unstructured-client
        python-wrapt)
    cd "unstructured-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
