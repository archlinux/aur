# Maintainer: Ayush Bhat <tfeayush@gmail.com>
pkgname=agentty-bin
_pkgname=agentty
# pkgver is rewritten from CMakeLists.txt (project VERSION) by scripts/release.sh.
pkgver=0.2.7
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
sha256sums_x86_64=('69ace0249da957d4802656e5c8b67371a983e0d3512c42324efcb96f956116a2')
sha256sums_aarch64=('4997e3a06356b58e20054f676c496112a2c19e7ad6a91f94410de170be78c7e3')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" \
                   "${pkgdir}/usr/bin/${_pkgname}"
}
