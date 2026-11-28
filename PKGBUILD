# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tiger-cli-bin
pkgver=0.30.0
pkgrel=1
pkgdesc="Command-line interface for Tiger Cloud"
arch=('x86_64' 'aarch64')
url="https://github.com/timescale/tiger-cli"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tiger-cli_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tiger-cli_Linux_arm64.tar.gz")
sha256sums_x86_64=('46733020d0218427dcf0f6b197dccdae40ef22973dbabeaf209f9f2edf92413f')
sha256sums_aarch64=('b722d1010c98fb78e1b317444263c750ad362a059f995b91d00b75cac940c143')

package() {
  install -Dm755 "tiger" "${pkgdir}/usr/bin/tiger"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "completions/tiger.bash" "${pkgdir}/usr/share/bash-completion/completions/tiger"
  install -Dm644 "completions/tiger.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/tiger.fish"
  install -Dm644 "completions/tiger.zsh" "${pkgdir}/usr/share/zsh/site-functions/_tiger"
}
