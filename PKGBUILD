# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v0.30.0 # renovate: datasource=github-releases depName=spacelift-io/spacectl vPrefix=true
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')

source_x86_64=(spacectl-${pkgver}-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-${pkgver}-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)

sha256sums_x86_64=('e0c5ddd3a9cd6a7b8615efa6d8b9e02e16cdfaf3b7a3fbf9b7dc52c83887af2a')
sha256sums_aarch64=('cc241f8751b2cf30ab6ecab1672a40890f73f71658c75a1b41da642780c8cc00')

package() {
  unzip -o spacectl-${pkgver}-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
