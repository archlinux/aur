# Maintainer: Abdelzaher Abdelgwad <abdelzaher.abdelgwad@gmail.com>
# Auto-generated from packaging/aur/PKGBUILD.template by .github/workflows/release.yml
pkgname=csm-bin
pkgver=0.1.9
pkgrel=1
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
sha256sums_x86_64=('68f14073327a7d5a33fbe4c222e95279f950a6bde9fc48c73a53ad5f76b6f85c')
sha256sums_aarch64=('0d86d752d57cd1c8d72f60cdbe88e360742f8e6b4c713739ad2bbfaf7f32bd6e')

package() {
  install -Dm755 "${srcdir}/csm-${pkgver}-linux-"* "${pkgdir}/usr/bin/csm"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
