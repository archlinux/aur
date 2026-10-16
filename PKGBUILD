# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
#
# Template: the release workflow sets pkgver, pkgrel and the checksums from
# the release's archives, then publishes it to the AUR.
pkgname=rimor-bin
pkgver=0.6.0
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
sha256sums_x86_64=('4dccb9bda7eb5248bb9ed1fb70805c780460544528cbb1aa8b693b6680e38e48')
sha256sums_aarch64=('c29014b93d0dde04794b6e92795730b58590d3c35f02b33009c8a1e8e79df623')

package() {
  install -Dm755 rimor "${pkgdir}/usr/bin/rimor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
