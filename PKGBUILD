# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zerolang-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="The Programming Language for Agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/zerolang"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vercel-labs/zerolang/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/zero-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/zero-linux-arm64")
sha256sums=('6bbf26264f5a7a1cc2c15a85a1c99ce50322c5a270cfaaaba548987f07f1ae04')
sha256sums_x86_64=('84a3c79d482260ee15660a49fc6b904afc927a230d05a4263039dd4dd1360e87')
sha256sums_aarch64=('ba7a1e4292dcbf84aec4c2a80919a7313bcf6182afcdc6cc9d9b7bb5946440d1')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/zero"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
