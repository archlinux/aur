# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=resin-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="A high-performance proxy pool gateway"
arch=('x86_64' 'aarch64')
url="https://github.com/Resinat/Resin"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Resinat/Resin/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/resin-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/resin-linux-arm64.tar.gz")
sha256sums=('61e67a400433b82fa97610fc5d6252ca49287c6037475a250733f541d3e6131e')
sha256sums_x86_64=('93510eb7d5abbaa49d964092555d0cb27badcad70bf366ea79f763e118300661')
sha256sums_aarch64=('04de30521da0b263ae526db92789e264b1b39a4ab2fca7ba6208b7a4ac4b1e38')

package() {
  install -Dm755 "resin" "${pkgdir}/usr/bin/resin"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
