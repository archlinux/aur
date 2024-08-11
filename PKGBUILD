# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v1.2.1 # renovate: datasource=github-releases depName=spacelift-io/spacectl vPrefix=true
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')

source_x86_64=(spacectl-${pkgver}-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-${pkgver}-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)

sha256sums_x86_64=('df282f39473954e93a2a5adbb29dbfac1ace63e419442d58a6dbf4ffbbd15932')
sha256sums_aarch64=('f4f8a6bb4663040bc93579282460a8a2189d1e81de8f9e3ed28c7cb14bc0291a')

package() {
  unzip -o spacectl-${pkgver}-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
