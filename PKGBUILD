# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.11.0
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
_extdir="proto_cli-${arch[0]}-unknown-linux-gnu"
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_extdir}.tar.xz")
sha512sums=('7320c7bdb599b0d2dc23450ec4aa2971aea5d91429793ec39c957bfa05f6d6b282a82a5f69fa1f87932edac3006614cbb2675ba256da8783333f1c70d32a4ad3')

package() {
  cd "${_extdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
