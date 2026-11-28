# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=distill-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Persistent memory and context layer for LLM agents"
arch=('x86_64' 'aarch64')
url="https://github.com/Siddhant-K-code/distill"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Siddhant-K-code/distill/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/distill_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/distill_${pkgver}_linux_arm64.tar.gz")
sha256sums=('a669ee1a7ee2fd4e1a4024d6a2579da845ad577e14b7c177778270df210b02ca')
sha256sums_x86_64=('b23cd14b273452a0c179a218a2e768354b84016339bb103c2dd6de900646f54c')
sha256sums_aarch64=('f986d9bb04acfe7e18972bd6e52d55d89d3c9e8ea344fbd203d6dc59ce7c4eb9')

package() {
  install -Dm755 "distill" "${pkgdir}/usr/bin/distill"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "completions/distill.bash" "${pkgdir}/usr/share/bash-completion/completions/distill"
  install -Dm644 "completions/distill.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/distill.fish"
  install -Dm644 "completions/distill.zsh" "${pkgdir}/usr/share/zsh/site-functions/_distill"
}
