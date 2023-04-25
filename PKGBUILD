# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.11.4
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
sha256sums_x86_64=('b12f66ec1100d9669112f6e1217c60542287e41e9cdaaee5536880c8801c540d')
sha256sums_aarch64=('f4dbfc1cdc2c2ed6cdb97989abbb42ca098404751555d0239a6b184249e9eb60')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
