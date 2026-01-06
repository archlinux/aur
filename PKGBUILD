# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.18.5
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
sha256sums_x86_64=('dcdd9add826e3bee5bb11a1ffece92cb64c1eacad564d2545f8bab4245d17dd8')
sha256sums_aarch64=('d92a873b44517d2901b10381ac679b8f325f4a59fbdd5a1619c1fe5a4b97bdf0')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
