# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v0.14.0
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')

source_x86_64=(spacectl-${pkgver}-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-${pkgver}-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)

sha256sums_x86_64=('08d4eba68dcf2181006fb98574c1f0f0dad1e7fc10b08c18ab886350513cc64c')
sha256sums_aarch64=('6cf6de81574b271e5c7ba1db729af1ba7738d10d6738b6558815d6ab53a89d8e')

package() {
  unzip -o spacectl-${pkgver}-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
