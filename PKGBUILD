pkgname=python-pkgbuild-parser
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MPL-2.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('4dba0fb1959ba710c2ef9a95602cac07fd9b532caa90fa55715e0b9b197c653a05acc15f1df45504e861f01c7f530408af6793fe987685b6e46b301c1c1ccc69')
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
