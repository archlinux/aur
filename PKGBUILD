# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.13.0
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
sha256sums_x86_64=('33d06c144ab39b3966d815f9bf2474c331fc32b1ee52d1c2f559f0443dcdfc9a')
sha256sums_aarch64=('1c4a2d2acec14d3d1d52e51b1723608d7dfd54dc77d483be71e7774c9f870ec8')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
