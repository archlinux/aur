# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
#
# Template: the release workflow sets pkgver, pkgrel and the checksums from
# the release's archives, then publishes it to the AUR.
pkgname=rimor-bin
pkgver=0.8.1
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
sha256sums_x86_64=('1bcc5d0b9cad057acac5bb99fd904fc8440ad555662d987604fa420b909e8225')
sha256sums_aarch64=('401b9c7468c56bb858cca159bf314774c599c6591e891f9c30dfe0e982098b77')

package() {
  install -Dm755 rimor "${pkgdir}/usr/bin/rimor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
