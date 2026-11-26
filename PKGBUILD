# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=biomcp-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Biomedical data access for AI agents over MCP"
arch=('x86_64' 'aarch64')
url="https://github.com/genomoncology/biomcp"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/genomoncology/biomcp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/biomcp-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/biomcp-linux-arm64.tar.gz")
sha256sums=('6b37b76fb5f5b29c74d9c0e35f9dc18b8e46273eadba8048513887f2d5feaabf')
sha256sums_x86_64=('c21292950988962eb32de2df56a5c56ccff707f83365b0f2e94a358fa9a0b5d0')
sha256sums_aarch64=('fb76b9ec47c580ba020ed9395877e118bef3ef1ead1670229fe2553eea5a1a49')

package() {
  install -Dm755 "biomcp" "${pkgdir}/usr/bin/biomcp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
