# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=herlang-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Her programming language"
arch=('x86_64' 'aarch64')
url="https://github.com/justjavac/herlang"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/justjavac/herlang/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/herlang-x86_64-unknown-linux-gnu.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/herlang-aarch64-unknown-linux-gnu.zip")
sha256sums=('98078c5579ec87d9660f5404b53916a329dee0a90d62234a4d3159c73897edcb')
sha256sums_x86_64=('9bb996110502092aa76372c648ab837c434dfa4eb9829aff24cfc90844151033')
sha256sums_aarch64=('2830b9fc39d76e6c79b027f3416efab4f76ef98ac1f783c828416228ba054ed3')

package() {
  install -Dm755 "herlang" "${pkgdir}/usr/bin/herlang"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
