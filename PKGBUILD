# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
#
# Template: the release workflow sets pkgver, pkgrel and the checksums from
# the release's archives, then publishes it to the AUR.
pkgname=rimor-bin
pkgver=0.4.0
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
sha256sums_x86_64=('56204ad5c11a9062305631949453e71dc7c2fc3b79368cee3fabccc5e9a35021')
sha256sums_aarch64=('8cb260a8a3fc217714c890652f364afc7ce9515e3985742b12d032e39c3eb7e3')

package() {
  install -Dm755 rimor "${pkgdir}/usr/bin/rimor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
