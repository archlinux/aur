# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.11.1
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
_extdir="proto_cli-${arch[0]}-unknown-linux-gnu"
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_extdir}.tar.xz")
sha512sums=('ec60a09f33e1fed74c2e7459511e89be6451a423ccc10e9e1f3c5bb2a5fad0e570093439eb686f704f4899bd18e687bfd54e19ef069f16a22350a52b6edf114a')

package() {
  cd "${_extdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
