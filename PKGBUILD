# Maintainer: surtsingv <282812635+surtsingv@users.noreply.github.com>
pkgname=cc-switch-cli-musl-bin
pkgver=5.10.3
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
sha256sums_x86_64=('1f75fbdbbac40c9ff07c7c835b82ce9749f09e573a473a2cfcaa9b496c8cc191')
sha256sums_aarch64=('486951a424e56bd1d54c96a48c2cec329402947f94c529cdd79f8a70efb8a30a')

package() {
  install -Dm755 "${srcdir}/cc-switch" "${pkgdir}/usr/bin/cc-switch"
  install -Dm644 "${srcdir}/upstream-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
