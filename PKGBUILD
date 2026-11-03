# Maintainer: Ayush Bhat <tfeayush@gmail.com>
pkgname=agentty-bin
_pkgname=agentty
# pkgver is rewritten from CMakeLists.txt (project VERSION) by scripts/release.sh.
pkgver=0.9.44
pkgrel=1
pkgdesc="Blazing-fast Claude in your terminal — 8.8 MB static binary, sandboxed by default, one-command SSH airgap. C++26 alternative to claude-code."
arch=('x86_64' 'aarch64')
url="https://github.com/agentty-org/agentty"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('bubblewrap: sandbox bash/diagnostics tool calls'
            'openssh: for `agentty airgap`')

source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/agentty-linux-x86_64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/agentty-linux-aarch64")

# Placeholders — release.sh runs `updpkgsums` and rewrites these from the
# published SHA256SUMS before tagging the AUR commit.
sha256sums_x86_64=('6b66fc3effe2d89a44a670134117aa09bfd5473d50e44d971ed02bec2b6c604e')
sha256sums_aarch64=('b4387abc52a2b8aac2553ba8be0e34efdd1d1d5c5dc631c7292d9bf536453bb5')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" \
                   "${pkgdir}/usr/bin/${_pkgname}"
}
