pkgbase='python-python-iso639'
pkgname=('python-python-iso639')
_src_folder='iso639-2025.11.16'
pkgver='2025.11.16'
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
url="https://github.com/jacksonllee/iso639"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/jacksonllee/iso639/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e47d13955143d87e0ce976632dbbb8466dfc7c218bfab1d670705bd20f23fbf')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
