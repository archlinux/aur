# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Static image export for web-based visualization libraries with zero dependencies"
arch=(any)
url="https://github.com/plotly/${_base}"
options=(!strip)
license=(MIT)
depends=(python-plotly sqlite)
makedepends=(python-installer)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(${url}/releases/download/v${pkgver}/${_base,,}-${pkgver}-py3-none-any.whl)
sha512sums=('540ed2a7603518a9d4c005cdd046d5ea3fff725c5e2d711099acea8b93d5c41793761fd696031130342bf35698a03a3d6e0bebf0f0adea60618fca9ac85c7731')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}-${pkgver}-*.whl
}
