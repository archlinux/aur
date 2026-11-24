# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=1.5.2
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
sha512sums=('4ed6cca0aa850987f2a9b9505cef9676fc52a42f1eefc90e8f07fd890dc891192c328b946d84298b9c90801a487c6aea83e2b1bd6147a7f7aae3d8e29bc53194')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}-${pkgver}-*.whl
}
