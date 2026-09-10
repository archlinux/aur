# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=1.4.0
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
sha512sums=('65cd05f64ecaf3da328eecbe1a561e84f413408cab9f1bd8f14c7f9d93f70643fc522eccb6bfbf9af5046bc86506532031362669b717e1d220cd35a0d776a728')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}-${pkgver}-*.whl
}
