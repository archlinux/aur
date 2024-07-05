# Maintainer: Berrit Birkner <aur at bbirkner.de>

pkgname=python-apkinspector
pkgver=1.3.0
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
sha256sums=('c35c7e3eb6e94e3d988db9968f6e85e1d94b7c57b1cbad052524a9d15a999eb1')

build () {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
