# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=claude-dashboard-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="k9s-style TUI for managing Claude Code sessions via tmux"
arch=('x86_64' 'aarch64')
url="https://github.com/seunggabi/claude-dashboard"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/claude-dashboard_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/claude-dashboard_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('4ce955923739e8b62d852601ff477900dbfa327d59052afd6c52423f8618a214')
sha256sums_aarch64=('f5ef72c137d38163275602a2f0dddeb777b0f44fb3a16130b38bc871913037d2')

package() {
  install -Dm755 "claude-dashboard" "${pkgdir}/usr/bin/claude-dashboard"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
