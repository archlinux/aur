# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.19.4
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
sha256sums_x86_64=('c7c37a5f27ed2ae2d5495c6ddbecc61cebbb841508e77af3c131e96f005ed247')
sha256sums_aarch64=('ba7f521458147de327cdb0f4bf73abea5bb6c29c1fb8a1e0e16d9bfb50951b31')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
