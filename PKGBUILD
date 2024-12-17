pkgbase='python-python-iso639'
pkgname=('python-python-iso639')
_src_folder='iso639-2024.10.22'
pkgver='2024.10.22'
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
url="https://github.com/jacksonllee/iso639"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/jacksonllee/iso639/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4e382749eb4dac282675f79a64697dce5806fd708313a9183cf96ed94e0f6cb')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
