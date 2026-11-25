# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vibium-bin
pkgver=26.11.16
pkgrel=1
pkgdesc="The verification layer for coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/VibiumDev/vibium"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/VibiumDev/vibium/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/vibium-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/vibium-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('7eee3628055f94bb1613ac9c65d3f31690e4195d72f4ea3314d5f91fc7c9f7f0')
sha256sums_aarch64=('de4c963e7580c3b9b4bed534ca15bec811e0cd06a84c0781156c95f5c912d835')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/vibium"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
