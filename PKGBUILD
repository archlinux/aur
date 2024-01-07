# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

_py="python"
_pkg="trovotutto"
_pkgbase="${_py}-${_pkg}"
pkgname="${_pkg}"
pkgver=0.1
pkgrel=3
pkgdesc='Small naive python 3.x search engine using k-grams'
arch=('any')
_http="https://github.com"
_ns="tallero"
url="${_http}/${_ns}/${_pkg}"
_local="file://${HOME}/${_pkg}"
license=('AGPL3')
depends=(
  "${_py}"
  "${_py}-nltk"
  "${_py}-pyxdg"
  "${_py}-setproctitle"
)
makedepends=(
  # 'git'
  "${_py}-setuptools"
)
provides=(
  "${_pkgbase}=${pkgver}"
)
conflicts=(
  "${_pkgbase}"
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  # "${pkgname}-${pkgver}::git+${_local}#tag=${pkgver}"
)
sha256sums=(
  '2e93b85675efbeaa289bc9b531ca1f60990bee688a2cf36e9a13bf681691fe53'
  # 'SKIP'
)

package() {
  cd \
    "${pkgname}-${pkgver}"
  "${_py}" \
    setup.py \
      install \
      --root="${pkgdir}" \
      --optimize=1
}

# vim: ts=2 sw=2 et:
