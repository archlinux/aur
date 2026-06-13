pkgname=python-pkgbuild-parser
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MPL-2.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('0db2a308ce9348eca250130e24d16090416eddea931f85319bab69eeda3eda07ae77885cd2f45eb30c5be24e43770e50bce6552871afb985078187568160e13f')
conflicts=()
depends=(
    'python'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)

build() {
    cd "${srcdir}/pkgbuild_parser"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/pkgbuild_parser"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
