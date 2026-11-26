# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sgpt-bin
pkgver=2.21.3
pkgrel=1
pkgdesc="Query OpenAI models, generate shell commands and code from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/tbckr/sgpt"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sgpt_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sgpt_Linux_arm64.tar.gz")
sha256sums_x86_64=('e9a802a63b018a323991237d8243fcea33014c61faee2e9e10569443d72248ac')
sha256sums_aarch64=('b3390803d4770c89c80272a32ac5b588647a26de473532d3fc90040c46f23b23')

package() {
  install -Dm755 "sgpt" "${pkgdir}/usr/bin/sgpt"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/sgpt.bash" "${pkgdir}/usr/share/bash-completion/completions/sgpt"
  install -Dm644 "completions/sgpt.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/sgpt.fish"
  install -Dm644 "completions/sgpt.zsh" "${pkgdir}/usr/share/zsh/site-functions/_sgpt"
  install -Dm644 "manpages/sgpt.1.gz" -t "${pkgdir}/usr/share/man/man1"
}
