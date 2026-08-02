pkgname=python-pkgbuild-parser
pkgver=2.2.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MPL-2.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('e1426d61d386ab9ddd219c53382c825eaee67eea16c5ef6bc7702f20cb0d28dd23e994c97e036a0fc49633da6737b994c4ee8215f37676124334d4c6324e5922')
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
