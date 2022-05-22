# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v0.9.2
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')
source_x86_64=(spacectl-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)
md5sums_x86_64=('fba32872c45bb1a632258902b3f8abb6')
md5sums_aarch64=('bb069c4bb039d9c1b0cbd7a3cd4f423e')

package() {
  unzip -o spacectl-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
