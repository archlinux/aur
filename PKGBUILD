# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=llmtrim-bin
pkgver=0.13.9
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
sha256sums_x86_64=('09be431f703fceb822907d367780a1d899445366bbc2c2ab848a94b07a97ece5')
sha256sums_aarch64=('3a9da53b66042314662863dbc90fec67355345d8f2b8e0d8fd28857fb1a98f30')

package() {
  install -Dm755 "llmtrim" "${pkgdir}/usr/bin/llmtrim"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
