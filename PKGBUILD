# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=1.0.0
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
sha512sums=('c927b22f6566cd0fc5951f962ce8b1e3e603d86c2f7ea641e7a6a1e04ccee6294371537e6703179570400edeeb728e0f7e9c92a2d418b79abdd7a0619073e112')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}-${pkgver}-*.whl
}
