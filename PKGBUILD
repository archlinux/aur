pkgbase='python-python-iso639'
pkgname=('python-python-iso639')
_src_folder='iso639-2024.2.7'
pkgver='2024.2.7'
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
url="https://github.com/jacksonllee/iso639"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/jacksonllee/iso639/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7eceff200ca1b74bb63aada75f58fe7403b44b2f1d3c41ddec4e2254a25a65fd')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
