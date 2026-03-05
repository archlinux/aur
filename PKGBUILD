pkgname=python-pkgbuild-parser
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=("1b1b948d4c9a73eb018805bb844feebbe231e0466470b659f2d082e8b8d91bea03faf6898a56c2d8edd526d36d8a3ea353a96e22d1cd6d9195c4452c0e81ab88")
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
