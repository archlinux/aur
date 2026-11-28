# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=term-llm-bin
pkgver=0.9.130
pkgrel=1
pkgdesc="Multipurpose LLM tool for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/term-llm/term-llm"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/term-llm_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/term-llm_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e0bc7afea26abca71bb541ae3bc31f5c0ae343c1beb2fb2fc55366d626145835')
sha256sums_aarch64=('36cf4554b1edc581cc0681ff9a7df4f736a803f7def5e582d67ffdf13d76fe17')

package() {
  install -Dm755 "term-llm" "${pkgdir}/usr/bin/term-llm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/codemode/LICENSE.quickjs-ng" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/codemode/LICENSE.quickjs-wasi" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/reflow/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/terminal/renderer/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/terminal/runtime/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
