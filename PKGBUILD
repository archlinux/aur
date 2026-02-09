pkgbase='python-python-iso639'
pkgname=('python-python-iso639')
pkgver='2026.1.31'
_src_folder="iso639-$pkgver"
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
url="https://github.com/jacksonllee/iso639"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/jacksonllee/iso639/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8bff8df30d221200c95b0a2087214abcac2e45be4aac4359fce6f9b8df7f400')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
