# Maintainer: Áron Ricardo Perez-Lopez <cyanokobalamyne at gmail dot com>
_pkgname=blackcat
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc='A modern cat written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/j-c-m/blackcat'
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=('https://raw.githubusercontent.com/j-c-m/blackcat/refs/tags/v0.7.0/LICENSE.md')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64-${pkgver}.tgz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64-${pkgver}.tgz")
sha256sums=('48050ac854a202b1844ca3fe03f43a3cc973194a16253649c9fc87d1b9536681')
sha256sums_x86_64=('1583fbe50de3886ed6d43604600d8b7d4392a57242d87fdcd3ad4f0d4d47a4f8')
sha256sums_aarch64=('bdf9cb8be110cfc788da28c6c36c4a37787cc36bc62ba874fe9ca0f8063cc44f')

package() {
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgname}-linux-${CARCH}-${pkgver}"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin/"
}
