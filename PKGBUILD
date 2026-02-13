# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=cherryctl-bin
pkgver=0.9.0
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
sha256sums_x86_64=('aef25fb2d3a7825521292d7e664a753e8ce617ebbf19d2aee5cd82f0321ce0fd')
sha256sums_aarch64=('155cdff6330be2d55d2035ccb27f75ec0aec7e2b3fda2e7fc6a6265a10abe06f')

package() {
  # Install binary
  install -Dm755 "cherryctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cherryctl"
  
  # Download and install license file
  curl -sL "${url}/raw/v${pkgver}/LICENSE.md" -o LICENSE.md
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}