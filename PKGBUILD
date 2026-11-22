# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=termfarm-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple idle farming game"
arch=('x86_64' 'aarch64')
url="https://github.com/indium114/termfarm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/indium114/termfarm/${pkgver}/LICENSE.md")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/termfarm_Linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/termfarm_Linux_arm64")
sha256sums=('3c6655af7d1c7f38dd4a741d5d1c07e37a4342cafc42f6d11fe7d47e94bfcd62')
sha256sums_x86_64=('32c5e220ec62e03296d9d053424cd8c87818b27ee0a05b22350725945025e17d')
sha256sums_aarch64=('28afd2e93fd08ee345d2bec4a224a62d5bb1c86d3defbd4bbe6cce8ddbf1068c')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/termfarm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
