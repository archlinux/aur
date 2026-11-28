# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=regolith-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Minecraft Bedrock add-on compiler pipeline"
arch=('x86_64' 'aarch64')
url="https://github.com/Bedrock-OSS/regolith"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/regolith_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/regolith_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('22d293c896e9b857e5e95f536cb32257e2056fc0b7863b1c3ebfd5612a91eb67')
sha256sums_aarch64=('e70c83f056b71c82d0889ac87ad6b2c8a287792c1a8444dc662e6a039ba2533d')

package() {
  install -Dm755 "regolith" "${pkgdir}/usr/bin/regolith"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.rtf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
