# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.9.0
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
sha256sums_x86_64=('63d62f6ea4b2daedaa08f95fbb95e457b4ee5d00167f4a84af0ba7ca3225924d')
sha256sums_aarch64=('26aa4c0b5455e76a5dfb47504227552dad750a4fd62f5764c00c26dcc9547f7b')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
