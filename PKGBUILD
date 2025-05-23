# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=spacectl-bin
pkgver=v1.14.0 # renovate: datasource=github-releases depName=spacelift-io/spacectl vPrefix=true
pkgrel=1
pkgdesc="Spacelift client and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/spacelift-io/spacectl"
license=('MIT')

source_x86_64=(spacectl-${pkgver}-x86_64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_amd64.zip)
source_aarch64=(spacectl-${pkgver}-aarch64::https://github.com/spacelift-io/spacectl/releases/download/${pkgver}/spacectl_${pkgver//v}_linux_arm64.zip)

sha256sums_x86_64=('61d698158c22cdf383b067000dac424fc41634d60d3addef48efbe6296ba8042')
sha256sums_aarch64=('fb670c4f735fb074402de0d14c72028304cf787be2faa0dc51bad1560b3e36eb')

package() {
  unzip -o spacectl-${pkgver}-${arch} spacectl
  install -Dm755 spacectl "$pkgdir/usr/bin/spacectl"
}
