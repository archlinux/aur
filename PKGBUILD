# Maintainer: Ayush Bhat <tfeayush@gmail.com>
pkgname=agentty-bin
_pkgname=agentty
pkgver=0.1.0
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
sha256sums_x86_64=('b559908ea7b7acf3ff10647e8b102a84048641566f0595f0c2356949601e55a0')
sha256sums_aarch64=('73c487b5820d24efe19abb119f54d94eaee9b94b9caad4bdced61bba4be629b6')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" \
                   "${pkgdir}/usr/bin/${_pkgname}"
}
