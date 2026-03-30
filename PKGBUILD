pkgname=python-pkgbuild-parser
pkgver=1.2.0
pkgrel=1
pkgdesc="Simple Python module to extract basic information directly from PKGBUILD files (not .SRCINFO)"
arch=('any')
url="https://codeberg.org/KevinCrrl/pkgbuild_parser"
license=('MPL-2.0')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('e0c1e2bf14eb0f360293ea25bf371e76ab5223659e453ae28b66333da5cdcbb42e5729a407ee3e1cf8e1a0d1430dac4417c013a933222ce7baa911047a71ab8c')
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
