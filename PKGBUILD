# Maintainer: agony <27015 at riseup dot net>

pkgname=helix-db-bin
pkgver=3.7.0
pkgrel=1
pkgdesc='CLI for an OLTP graph database with vector and full-text search (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/HelixDB/helix-db'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
optdepends=('docker: run local instances'
            'npm: TypeScript queries and agent skill installs'
            'podman: run local instances')
provides=("helix-db=${pkgver}")
conflicts=('helix-db')
install=helix-db.install
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("helix-${pkgver}-x86_64-unknown-linux-gnu::${_release}/helix-x86_64-unknown-linux-gnu")
source_aarch64=("helix-${pkgver}-aarch64-unknown-linux-gnu::${_release}/helix-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('eccac5d127462ff2e760747f5bc13053c8a7ef86277fe43dd45b284d5df0740f')
sha256sums_aarch64=('2dd4f48763621b5a44e127ac94ece7ec20f14cec7899d5514dc1294310ef3109')

package() {
  install -Dm755 helix-"${pkgver}"-*-unknown-linux-gnu "${pkgdir}/usr/bin/helix-db"
}
