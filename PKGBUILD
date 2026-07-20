# Maintainer: Ayush Bhat <tfeayush@gmail.com>
pkgname=agentty-bin
_pkgname=agentty
# pkgver is rewritten from CMakeLists.txt (project VERSION) by scripts/release.sh.
pkgver=0.2.8
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
sha256sums_x86_64=('84a701fb3144484636dba98a90399c5f6ab44159944f40e91e64dbcdf89878aa')
sha256sums_aarch64=('24929b7cff338c8cfd349ae83510c2a56d4c9ec72458db1e7280b8e50bee425f')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" \
                   "${pkgdir}/usr/bin/${_pkgname}"
}
