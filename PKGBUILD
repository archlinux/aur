# Maintainer: Berrit Birkner <aur at bbirkner.de>

pkgname=python-apkinspector
pkgver=1.3.5
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
sha256sums=('84f5784fd39ef17b86cda3d0af3f90c1db031bf95ad7eae41ad2ee8f08cbe8e9')

build () {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
