# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio-bin
_pkgname=disc-image-studio
pkgver=1.6.0
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
sha256sums_x86_64=('44772e1c990c7966cc49fadebe4a8a66ac6f3ffb7fe0826908efc76d95170f3f')
sha256sums_aarch64=('3813053a2bd12400280ed8e96a005fd3f5bff58a1cef88fa8b6822323ba6931e')

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 THIRD-PARTY-NOTICES.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
