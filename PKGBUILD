pkgbase='python-python-iso639'
pkgname=('python-python-iso639')
_src_folder='iso639-2023.6.15'
pkgver='2023.6.15'
pkgrel=1
pkgdesc="Look-up utilities for ISO 639 language codes and names"
url=""
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/jacksonllee/iso639/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3082eb047cb1b1eeb2754203553b93451629a3c2828ca7dfae034e7ead6f6b1c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
