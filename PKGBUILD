# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v0.24.2
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')

source_x86_64=(spacectl-${pkgver}-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-${pkgver}-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)

sha256sums_x86_64=('1ee1678e55821a8182e40c142d45dab5d5ba17f94a58b1ad8f33c04c9e1b50fc')
sha256sums_aarch64=('cb024fdac2393100933679d06a0a956fb8d640f5a68f02144af311c3ed66d258')

package() {
  unzip -o spacectl-${pkgver}-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
