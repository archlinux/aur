# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.8.0
pkgrel=2
pkgdesc='Network, Service & Security Observability for Kubernetes using eBPF'
arch=('x86_64' 'aarch64')
url='https://cilium.io/'
license=('Apache')
makedepends=()
provides=("hubble=${pkgver}")
conflicts=()

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cilium/hubble/releases/download/v${pkgver}/hubble-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/cilium/hubble/releases/download/v${pkgver}/hubble-linux-arm64.tar.gz")
sha256sums_x86_64=('65a0835c27dcd43eda155ea53098962e87522245315f77f9e8aa9a0f9f75187d')
sha256sums_aarch64=('82cf90dbb440456e774fdca9764a62623173c3d181f5c538605cdcf18d1cd3bf')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
