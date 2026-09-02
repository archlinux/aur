# Maintainer: Abdelzaher Abdelgwad <abdelzaher.abdelgwad@gmail.com>
# Auto-generated from packaging/aur/PKGBUILD.template by .github/workflows/release.yml
pkgname=csm-bin
pkgver=0.2.2
pkgrel=1
# v0.3.0 was published to the AUR and then withdrawn in favour of v0.2.1.
# AUR versions only move forward, so without an epoch pacman would treat the
# replacement as older than what it withdrew and never offer the upgrade.
epoch=1
pkgdesc="Terminal UI for running multiple Claude Code sessions as tabs"
arch=('x86_64' 'aarch64')
url="https://github.com/AbdelzaherAbdelgwad/claude-sessions-manager-tui"
license=('MIT')
depends=('glibc')
optdepends=('claude-code: the Claude Code CLI that csm spawns (can also be installed via npm/bun)')
provides=('csm')
conflicts=('csm')
# bun --compile embeds the JS bundle in the binary; stripping destroys it
options=('!strip' '!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/AbdelzaherAbdelgwad/claude-sessions-manager-tui/v${pkgver}/LICENSE")
source_x86_64=("csm-${pkgver}-linux-x64::${url}/releases/download/v${pkgver}/csm-linux-x64")
source_aarch64=("csm-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/csm-linux-arm64")
sha256sums=('ffadef1b35435bbe565d5cc82397052e5447bbace85ca53e86268f64c13f1fed')
sha256sums_x86_64=('68ff7d94035cfc228fcabb8fd0db01b03efef8fbfbb6ec4254c5ecf32b6d56d6')
sha256sums_aarch64=('56565bb1c9971fd88801a544a6270d4f0a704d0062b88383e293f0efe22ba4fe')

package() {
  install -Dm755 "${srcdir}/csm-${pkgver}-linux-"* "${pkgdir}/usr/bin/csm"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
