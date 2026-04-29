pkgname=python-pkgbuild-parser
pkgver=2.0.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MPL-2.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('16bde2d976c1a7e498abfbae22442487ff8430de2fd16526f2da59681c54294cbb0a58a7785a9b5c3227ef7792e7d7a8e3bcaee7c2a32705279a7d932e7bd640')
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
