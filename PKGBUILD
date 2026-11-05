# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio-bin
_pkgname=disc-image-studio
pkgver=1.4.2
_asset=DiscImageStudio-CLI
pkgrel=1
pkgdesc='Generate CD, DVD and Blu-ray images that show a picture on the burned disc (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/JiaFeiMiao-K-Cat/DiscImageStudio'
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("${_asset}-${pkgver}-linux-x64.tar.gz::${_release}/${_asset}-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${_asset}-${pkgver}-linux-arm64.tar.gz::${_release}/${_asset}-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('335bf4e5ebe4881dfc2de8a4018c012e85d3b1a8b76a44ea7a2d2282e43fd8eb')
sha256sums_aarch64=('0e5fd6220126b42f1d921e1056241df8876bd9856830caabbee8560d98e573f5')

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 THIRD-PARTY-NOTICES.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
