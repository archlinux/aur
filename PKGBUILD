# Maintainer: robertfoster
pkgname=opencode-m0rf30-bin
pkgver=1.14.28 # renovate: datasource=github-releases depName=M0Rf30/opencode extractVersion=^v(?<version>.*)-m0rf30$
_forktag="v${pkgver}-m0rf30"
pkgrel=1
pkgdesc="The AI coding agent built for the terminal (M0Rf30 fork: fires tool.definition plugin hook for MCP tools)"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/opencode"
license=('MIT')
depends=('fzf' 'ripgrep')
provides=('opencode')
conflicts=('opencode' 'opencode-bin' 'opencode-git')
options=('!strip' '!debug')

source=("LICENSE::https://raw.githubusercontent.com/M0Rf30/opencode/${_forktag}/LICENSE")
source_x86_64=("${pkgname%%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${_forktag}/opencode-linux-x64.tar.gz")
source_aarch64=("${pkgname%%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${_forktag}/opencode-linux-arm64.tar.gz")

sha256sums=('625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b')
sha256sums_x86_64=('6276f86c303a7e530e3469bd5f76477424b1a5fe64cde4ef3f1b61c3a4d5e839')
sha256sums_aarch64=('8226d03dab79cf046d13ec594047faa15bf62b62d34dbb3fe4fbb713357857d0')

package() {
  install -Dm755 "${srcdir}/opencode" "${pkgdir}/usr/bin/opencode"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
