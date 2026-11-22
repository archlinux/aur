# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llmtrim-bin
pkgver=0.13.8
pkgrel=1
pkgdesc="A local proxy that compresses large-language-model API requests to reduce token costs"
arch=('x86_64' 'aarch64')
url="https://github.com/fkiene/llmtrim"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llmtrim-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llmtrim-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('812d092460dbf880910b46b7ebac686ef0bfdae201006391cb8d8b1144731ca8')
sha256sums_aarch64=('4f421db37334afd57f0b5b46fddef47a69724ec446de14621b0528a39ae0a713')

package() {
  install -Dm755 "llmtrim" "${pkgdir}/usr/bin/llmtrim"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
