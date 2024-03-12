# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-lap"
epoch=1
pkgver=0.4.0
pkgrel=1
pkgdesc='lap is a linear assignment problem solver using Jonker-Volgenant algorithm for dense (LAPJV) or sparse (LAPMOD) matrices.'
arch=(any)
url="https://github.com/gatagat/lap"
license=(BSD-2-Clause)
depends=(python python-scipy python-pytest python-numpy)
conflicts=()
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(lap-0.4.0.tar.gz::"$url/archive/refs/tags/v0.4.0.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/lap-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/lap-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
