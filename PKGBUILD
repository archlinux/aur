# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ssh-to-age-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert SSH Ed25519 keys to age keys"
arch=('x86_64' 'aarch64')
url="https://github.com/Mic92/ssh-to-age"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Mic92/ssh-to-age/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/ssh-to-age.linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/ssh-to-age.linux-arm64")
sha256sums=('6432c530937e553992d751a0cd4fdd0313bff2c0c0250dc8eec01bccad523ac0')
sha256sums_x86_64=('0a25d354e8154e79cfeecc5443ccf24136efd9d6c903fd03f61858e19a7020c6')
sha256sums_aarch64=('980c39fd08c7e8d077467c4bc6b92081944dbb15b795b0d3f52810312c482b1a')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/ssh-to-age"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
