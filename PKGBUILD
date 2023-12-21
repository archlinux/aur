# Maintainer: Truocolo <truocolo@aol.com>
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
pkgname=aspe
_pkgver=1.0
pkgver="v${_pkgver}"
pkgrel=1
pkgdesc="Arch Linux build source file clone tool"
arch=(any)
_host='https://github.com'
_ns='themartiancompany'
url="${_host}/${_ns}/${pkgname}"
license=(
  AGPL3)
depends=()
makedepends=(
  'reallymakepkg')
checkdepends=(
  shellcheck)
_url="file://${HOME}/${pkgname}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=(
  871cae6776e7e0275bca0fc9c9ff1435b6aac13323541131abc1b265ceb3a528
)

package() {
  cd \
    "${pkgname}-${_pkgver}"
  make \
    PREFIX="/usr" \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ft=sh syn=sh et
