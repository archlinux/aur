# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gonc-bin
pkgver=2.6.15
pkgrel=1
pkgdesc="Netcat with automated NAT traversal, secure P2P, file transfer and proxying"
arch=('x86_64' 'aarch64')
url="https://github.com/threatexpert/gonc"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/threatexpert/gonc/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/gonc_linux_amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/gonc_linux_arm64")
sha256sums=('83c3d1731419402c8aebb8ffd26ce9e7f6bccb5faedd86c9bbe2336bc203f775')
sha256sums_x86_64=('6e9c66e7297cf07a45be0978b853484506965ab84ec8f5c26069c9237eb583a7')
sha256sums_aarch64=('2c57c7662e5cb348d4b9f59d483c13e51b953b0588dfc8f18805933717fdbd0e')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/gonc"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
