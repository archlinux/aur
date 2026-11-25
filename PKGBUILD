# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=wg-obfuscator-bin
pkgver=1.6
pkgrel=1
pkgdesc="Obfuscator for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/ClusterM/wg-obfuscator"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/wg-obfuscator-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/wg-obfuscator-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('af30264278c70c2e53ad3234e8050686b3bef4f6564edc9fb068ea8c885b8354')
sha256sums_aarch64=('4c730b3370665e7fd81fb2b7800b87b3387b9a179e935cb6498f85a8fc088fb8')

package() {
  install -Dm755 "wg-obfuscator/wg-obfuscator" "${pkgdir}/usr/bin/wg-obfuscator"
  install -Dm644 "wg-obfuscator/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "wg-obfuscator/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
