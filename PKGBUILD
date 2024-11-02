pkgname=python-abi3info
pkgver=2024.10.26
pkgrel=1
pkgdesc="A library for abi3 and other CPython API information"
url="https://pypi.org/project/abi3info/"
arch=('any')
license=('MIT')
makedepends=('python-flit-core')
depends=('python')
source=("https://github.com/woodruffw/abi3info/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e81920cd94077904bc505a6e28fc5dfd97994e52de2ffedbcdc28c16e63a732e')

build () {
  cd "${srcdir}"/abi3info-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"/abi3info-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
