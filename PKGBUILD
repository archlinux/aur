# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=python-acestream
pkgver=0.2.0
pkgrel=4
pkgdesc="Python interface to interact with the AceStream Engine and the HTTP API"
arch=("any")
url="https://github.com/jonian/python-acestream"
license=("GPL-3.0-only")
depends=(
  python
  python-setuptools # for distutils.version.LooseVersion
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c4e29c8f5c5b7bef88d760a7937da369eb23a63e0a8b3cf56c874c85a9bfabb4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
