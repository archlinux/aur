# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio-bin
_pkgname=disc-image-studio
pkgver=1.4.1
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
sha256sums_x86_64=('57f46a3ab14d0112f9b4726e083237b9606917e8fa779407f11a3427a50aba4d')
sha256sums_aarch64=('c7ef93a74331f992dd6d43bc7ed9c023d002836dcddbc28674861e7be40fd785')

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 THIRD-PARTY-NOTICES.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
