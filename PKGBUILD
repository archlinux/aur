# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.16.2
pkgrel=1
pkgdesc='Network, Service & Security Observability for Kubernetes using eBPF'
arch=('x86_64' 'aarch64')
url='https://cilium.io/'
license=('Apache')
makedepends=()
provides=("hubble=${pkgver}")
conflicts=()

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cilium/hubble/releases/download/v${pkgver}/hubble-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/cilium/hubble/releases/download/v${pkgver}/hubble-linux-arm64.tar.gz")
sha256sums_x86_64=('fc9b153e9d48353be7502daf8388927df2d574c1375f5fa8a9de4e4a69374c85')
sha256sums_aarch64=('00e8730fa5ad449f373d73e0f4a91abe3a2ad21fe192c12b62563cf0fbfa44cf')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
