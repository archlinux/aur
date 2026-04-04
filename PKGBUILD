# Maintainer: Pierre Carru <pierre@carru.fr>
# Co-Maintainer: Chris Morris <chris at lexforged dot com>
pkgname=googleworkspace-cli-bin
pkgver=0.22.5
pkgrel=1
pkgdesc='One CLI for all of Google Workspace'
arch=('x86_64' 'aarch64')
url='https://github.com/googleworkspace/cli'
license=('Apache-2.0')
provides=('googleworkspace-cli' 'gws')
conflicts=('googleworkspace-cli' 'gws')
options=(!strip !debug)

_base_url="https://github.com/googleworkspace/cli/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}/google-workspace-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}/google-workspace-cli-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('de78ecdbd2f1a84cca0063a7ecbc440240fc14b6ebccbb17f4646b792a8c5c1f')
sha256sums_aarch64=('94490295d9580e1e88574e715a0a162991747d12d62f8c7b8dcc8268b6c1cea0')

package() {
    install -Dm755 "${srcdir}/gws" "${pkgdir}/usr/bin/gws"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
