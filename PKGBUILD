# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=openagent-bin
pkgver=2.89.2
pkgrel=1
pkgdesc="next-generation personal AI assistant powered by LLM, RAG and agent loops, supporting computer-use, browser-use and coding agent, demo: https://demo.openagentai.org"
arch=('x86_64' 'aarch64')
url="https://github.com/the-open-agent/openagent"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/the-open-agent/openagent/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/openagent_linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/openagent_linux_arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('2fede9b4262cece581c3134e778ad1b481457439a89e8eb356a47be9364be4f2')
sha256sums_aarch64=('131e347c0eeb09225c2a233e208b9903c112c8a92359ec8c43baa614bbb57949')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/openagent"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
