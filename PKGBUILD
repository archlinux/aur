# Maintainer: xiaot <i@sin.moe>

pkgname=sparxie-bin
_pkgname=sparxie
pkgver=0.1.0
pkgrel=3
pkgdesc="Cross-platform proxy controller for Mihomo, Clash, Surge, and sing-box"
arch=('x86_64' 'aarch64')
url='https://github.com/UruhaLushia/sparxie'
license=('GPL-3.0-only')
depends=('gtk3')
optdepends=("noto-fonts-cjk: CJK support"
            "noto-fonts-emoji: Emoji support")
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
options=('!strip' '!debug')
source_x86_64=("${_pkgname}-${pkgver}-amd64.deb::${url}/releases/download/v${pkgver}/sparxie-linux-x86_64.deb")
source_aarch64=("${_pkgname}_${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/sparxie-linux-arm64.deb")
sha256sums_x86_64=('d80acff84b859adbdf9d983945cd387b623f0d7abd75648bd47f9687574b8f9b')
sha256sums_aarch64=('ed4b51167d1c14a29f3ff758cb4dd4678dc2d1c380252f301351615a9fcf9212')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}

# vim: ts=2 sw=2 et:
