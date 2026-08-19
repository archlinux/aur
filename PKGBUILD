# Maintainer: surtsingv <282812635+surtsingv@users.noreply.github.com>
pkgname=cc-switch-cli-musl-bin
pkgver=5.10.2
pkgrel=1
pkgdesc="Static MUSL binary of the CC Switch CLI for Claude Code, Codex, and Gemini CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/SaladDay/cc-switch-cli"
license=('MIT')
provides=('cc-switch')
conflicts=('cc-switch' 'cc-switch-cli' 'cc-switch-cli-bin')
options=('!strip')
source=(
  'upstream-LICENSE'
)
source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-x64-musl.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/SaladDay/cc-switch-cli/releases/download/v${pkgver}/cc-switch-cli-v${pkgver}-linux-arm64-musl.tar.gz"
)
sha256sums=('33a4126cc116d9f4b6bd8e988d17372e6f270d738474d95e02bc30c5bd785b99')
sha256sums_x86_64=('8065c5bae9eda270747c1766cefbb2091d9625655dbf409ad7764eb47c0a8635')
sha256sums_aarch64=('b25c77f7eebbe3968c53022e1b5e703e324203e94e5c6379320bcd1bbe268e63')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
  install -Dm644 "${srcdir}/upstream-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
