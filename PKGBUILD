# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=yoloai-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Run AI coding agents in sandboxes"
arch=('x86_64' 'aarch64')
url="https://github.com/kstenerud/yoloai"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/yoloai_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/yoloai_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('0c53ad9a19291a12a287fc055d886516d007c9854768d7c18308f2230667b37c')
sha256sums_aarch64=('3fad0630350568c5659db7c238335b13c95fad4532c3bbd36377ea82bc030dad')

package() {
  install -Dm755 "yoloai" "${pkgdir}/usr/bin/yoloai"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/yoloai.bash" "${pkgdir}/usr/share/bash-completion/completions/yoloai"
  install -Dm644 "completions/yoloai.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yoloai.fish"
  install -Dm644 "completions/yoloai.zsh" "${pkgdir}/usr/share/zsh/site-functions/_yoloai"
}
