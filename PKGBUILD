# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Kaleido
pkgname=python-${_base,,}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Static image export for web-based visualization libraries with zero dependencies"
arch=(x86_64)
url="https://github.com/plotly/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-installer)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=(${url}/releases/download/v${pkgver}/${_base,,}-${pkgver}-py2.py3-none-manylinux1_x86_64.whl)
sha256sums_x86_64=('aa21cf1bf1c78f8fa50a9f7d45e1003c387bd3d6fe0a767cfbbf344b95bdc3a8')

package() {
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" ${_base,,}*.whl
  install -Dm 644 ${_base,,}/executable/LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base,,}/executable/README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
