# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v0.10.0
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')
source_x86_64=(spacectl-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)
md5sums_x86_64=('d1383b91435aa0d5b8c3da4a5a320804')
md5sums_aarch64=('ecb596965711b7e088b9bc8ea8d24d1d')

package() {
  unzip -o spacectl-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
