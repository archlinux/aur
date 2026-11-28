# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=agent-workspace-linux-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Isolated Linux desktop workspaces for AI agents over MCP"
arch=('x86_64' 'aarch64')
url="https://github.com/agent-sh/agent-workspace-linux"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/agent-sh/agent-workspace-linux/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/agent-workspace-linux-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/agent-workspace-linux-aarch64-unknown-linux-gnu")
sha256sums=('865367984df228c2bbf9df7e790b26c3b083376b705375db36a8a032daa03a25')
sha256sums_x86_64=('d919253e63540b57c6e7d566cd74680543981fdf79052f009367ec3e267db81b')
sha256sums_aarch64=('8f49e95ea756e164ef682ba9bf532a126d220881617f3166e677e9c9d04829ed')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/agent-workspace"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
