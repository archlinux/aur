# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=maple-bin
pkgver=3.4.10
pkgrel=1
pkgdesc="Local proxy for the Maple private AI chat service"
arch=('x86_64' 'aarch64')
url="https://github.com/MaplePrivacyLabs/Maple"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/MaplePrivacyLabs/Maple/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/maple-proxy-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/maple-proxy-linux-aarch64.tar.gz")
sha256sums=('076f3390f6342f51a64feadb9cd84d4ca41f56ebc6c2f9f1fe98fa255d853ad8')
sha256sums_x86_64=('8a49a411e0a93e5a63b64968f6247771a6886af6207d1a4bb30ec78fa8d15b3b')
sha256sums_aarch64=('fe18b53e9fff7baeb6972a6969bf323981c1c3c462166ca2faf6c0b4d9bf593f')

package() {
  install -Dm755 "maple-proxy" "${pkgdir}/usr/bin/maple-proxy"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
