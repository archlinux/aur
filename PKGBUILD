# Maintainer: Ayush Bhat <tfeayush@gmail.com>
pkgname=agentty-bin
_pkgname=agentty
# pkgver is rewritten from CMakeLists.txt (project VERSION) by scripts/release.sh.
pkgver=0.2.6
pkgrel=1
pkgdesc="Blazing-fast Claude in your terminal — 8.8 MB static binary, sandboxed by default, one-command SSH airgap. C++26 alternative to claude-code."
arch=('x86_64' 'aarch64')
url="https://github.com/1ay1/agentty"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('bubblewrap: sandbox bash/diagnostics tool calls'
            'openssh: for `agentty airgap`')

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/agentty-linux-x86_64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/agentty-linux-aarch64")

# Placeholders — release.sh runs `updpkgsums` and rewrites these from the
# published SHA256SUMS before tagging the AUR commit.
sha256sums_x86_64=('6bcc40765208f945aa5a8fd72f41d598aba2f2f979248fb15aeb6f738df24184')
sha256sums_aarch64=('75e77bce618617ee83ee0cf6703b0b8e8d89b688204de3cc6a30e555e14d2ec9')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" \
                   "${pkgdir}/usr/bin/${_pkgname}"
}
