# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio-bin
_pkgname=disc-image-studio
pkgver=1.3.6
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
sha256sums_x86_64=('b559cb0c072b61ae497cd9e953bc0be1de6ed79003977ccf2430e5ac4a9ba980')
sha256sums_aarch64=('e898fe2be9b39bc201d22f9398ed12d54a3542b32b4a015d39d801b6bef5743a')

package() {
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 THIRD-PARTY-NOTICES.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
}
