# Maintainer: Josephine Pfeiffer <jpfeiffe@redhat.com>

pkgname=cherryctl-bin
pkgver=0.6.0
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
sha256sums_x86_64=('4941439df3116b736555682922dcb2ba8c1c88dd222829125835d974df9afbab')
sha256sums_aarch64=('bad81e745ed1eae4a9034bf73d6ad8a08242775236f6f3f240ad2da3ef375031')

package() {
  # Install binary
  install -Dm755 "cherryctl-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/cherryctl"
  
  # Download and install license file
  curl -sL "${url}/raw/v${pkgver}/LICENSE.md" -o LICENSE.md
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}