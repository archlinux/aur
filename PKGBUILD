# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
#
# Template: the release workflow sets pkgver, pkgrel and the checksums from
# the release's archives, then publishes it to the AUR.
pkgname=rimor-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Terminal workbench for PostgreSQL, SQL Server and SQLite (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://rimor.dev'
license=('MIT')
provides=('rimor')
conflicts=('rimor')
options=('!debug' '!strip')
_release="https://github.com/alchemy/rimor/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_release}/rimor-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_release}/rimor-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('463f0a376b05c8c548d05d98374a4f57e0c3ae01464f0c5a34d3509cf9f1a0e8')
sha256sums_aarch64=('b6a3cad8c7132e9bc455bf6b7a66cad0f75c8746671514c68d95e7209558f3a7')

package() {
  install -Dm755 rimor "${pkgdir}/usr/bin/rimor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
