# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=1.3.0
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
sha512sums=('244d4c23a473f0c58cf83992ca2bc5064b416a8e128752eb73195cea033c84c34ab71fd1be04d7187dff79f8de4b656f5f713f7d08df46523d03e089b799cfbb')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}-${pkgver}-*.whl
}
