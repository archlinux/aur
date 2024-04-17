# Maintainer: Berrit Birkner <aur at bbirkner.de>

pkgname=python-apkinspector
pkgver=1.2.2
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
sha256sums=('9bf440c966fa66192d42532772b03e2a39d30f9437567a5b5145111a80bd7d34')

build () {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/apkInspector-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
