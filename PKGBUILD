# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lazyagents-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="TUI for managing AI coding agent skills, sessions, usage, providers and hooks"
arch=('x86_64' 'aarch64')
url="https://github.com/rogeriojunior31/lazyagents"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/lazyagents_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/lazyagents_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('62966cc919f1eb5218d8fc220acebfbdf012c7d5b1597cf914e77c15e71f7373')
sha256sums_aarch64=('deb65a77a8cc8362cbe3164e9b5199682d07694b54f43ff8897399bb7a6ec4da')

package() {
  install -Dm755 "lazyagents" "${pkgdir}/usr/bin/lazyagents"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/tui/theme/LICENSE-SP-Night" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "internal/tui/theme/LICENSES-themes.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
