# Maintainer: Filippo Veneri <filippo.veneri@gmail.com>
#
# Template: the release workflow sets pkgver, pkgrel and the checksums from
# the release's archives, then publishes it to the AUR.
pkgname=rimor-bin
pkgver=0.5.0
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
sha256sums_x86_64=('f10ae5482efcaf9fcf71d17854f95cccee8896f83f7f7433a785b7ca681b82b8')
sha256sums_aarch64=('3e41201894d4f85c228d5895d45e19fdc137dad433a88bc4e60a831db80a9c6c')

package() {
  install -Dm755 rimor "${pkgdir}/usr/bin/rimor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
