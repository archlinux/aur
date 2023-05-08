# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.11.5
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
sha256sums_x86_64=('fe369ef1c474f918064603dda8d78fd8550b0f67661f219ae9167a13cd156b2a')
sha256sums_aarch64=('a02dcc2cccaadf795b69a6435f0169b1e1e52c7a8089c00a9f772fd37855873f')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
