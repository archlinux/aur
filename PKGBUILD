# Maintainer: Berrit Birkner <aur at bbirkner.de>

pkgname=python-apkinspector
pkgver=1.3.4
pkgrel=1
pkgdesc="A tool to decode and manipulate android apks"
arch=('any')
url="https://github.com/erev0s/apkInspector"
license=('Apache-2.0')
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry-core'
)
depends=(
  'python'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/erev0s/apkInspector/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('346eba533729228727a96cbf606bdd80378c0eca66714018c48e6b6979acde1e')

build () {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
