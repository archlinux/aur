# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ggsrun-bin
pkgver=5.3.21
pkgrel=1
pkgdesc="Google Drive CLI and MCP server"
arch=('x86_64' 'aarch64')
url="https://github.com/tanaikech/ggsrun"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tanaikech/ggsrun/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ggsrun_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ggsrun_linux_arm64")
sha256sums=('8a987fab43e922f7eaf2fd7a1e2cc442c6d68234187d43b231a324c2f39348b6')
sha256sums_x86_64=('30e3d562b6297dc04ddb1c04d4d5ea3d3902f013197198df6eb2cd7cba5f5f06')
sha256sums_aarch64=('27771b89ca61b8fff2f3f3e408aad21561d3263e01b7ae91a4f10ea208286924')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ggsrun"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
