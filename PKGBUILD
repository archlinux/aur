# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=onessh-bin
pkgver=0.1.22
pkgrel=1
pkgdesc="SSH MCP server for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Lynricsy/OneSSH"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Lynricsy/OneSSH/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/onessh_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/onessh_${pkgver}_linux_arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('2237eec8cfe0f5f1857f98bf55e2f6bc2600006e3d67048a65b8dfd77e340d1a')
sha256sums_aarch64=('42d1d63857a66df9e3f5868a0d713833178ca66417275b76b18b14746c5903b1')

package() {
  install -Dm755 "onessh" "${pkgdir}/usr/bin/onessh"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
