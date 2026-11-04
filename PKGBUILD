# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio-bin
_pkgname=disc-image-studio
pkgver=1.4.0
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
sha256sums_x86_64=('23d39873b0fb8fee04cff60fa128b0419afeb70362d31dc8e05b8fe7328b4244')
sha256sums_aarch64=('9e231c0d5cde0a31c7601d21707cadac2a49454fad62ebf2e820cb742a22c071')

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 THIRD-PARTY-NOTICES.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
