pkgbase='python-python-iso639'
pkgname=('python-python-iso639')
_src_folder='iso639-2025.2.18'
pkgver='2025.2.18'
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
url="https://github.com/jacksonllee/iso639"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('Apache')
arch=('any')
source=("https://github.com/jacksonllee/iso639/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41c3778f72ed17da7269f133df5f054d9a3109985028560d24638547abdb7f45')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
