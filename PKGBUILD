# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.8.1
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
sha256sums_x86_64=('919ed7e2af1bf2335c6967b34ba3fac406a4948f9b54ebcace96ebc3a16fc9d0')
sha256sums_aarch64=('662a5a5f5e21f494e683c1acab28aa1460ff3fd0ac26a9473ba3c84125f08145')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
