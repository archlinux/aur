# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=cherryctl-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Cherry Servers CLI for managing cloud infrastructure (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/cherryservers/cherryctl'
license=('MPL-2.0')
depends=('glibc')
conflicts=('cherryctl')
provides=('cherryctl')
source_x86_64=("cherryctl-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/cherryctl-linux-amd64")
source_aarch64=("cherryctl-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/cherryctl-linux-arm64")
sha256sums_x86_64=('572abace2c682670776c9c45cea729f6b5ee5afc43cb23a74a73d9eeaf9ee49c')
sha256sums_aarch64=('195121c36f4ecd545389eb78c2acde4230ae9cee660e483baef4384d0c2dafb7')

package() {
  # Install binary
  install -Dm755 "cherryctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cherryctl"
  
  # Download and install license file
  curl -sL "${url}/raw/v${pkgver}/LICENSE.md" -o LICENSE.md
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}