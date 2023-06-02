# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=proto
pkgname="${_pkgname}-bin"
pkgdesc='A multi-language version and dependency manager'
pkgver=0.10.2
pkgrel=1
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://github.com/moonrepo/proto'
arch=('x86_64')
depends=('git')
_extdir="proto_cli-${arch[0]}-unknown-linux-gnu"
source=("${pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_extdir}.tar.xz")
sha512sums=('2cb593d989d598d15da14162609498f81016973223ff3dd748877374b13c66d670162898db81ebf5ff74202e61b7b22bcc55c1aead6fba6f1df08096e7ec2c01')

package() {
  cd "${_extdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
