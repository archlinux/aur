# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.13.5
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
sha256sums_x86_64=('36bae756aead371373607af33c3cc6005423d6bd6866d16ea8f5bebc12167928')
sha256sums_aarch64=('b95f8f8c70bba31777a5882ab89a47dcfa0f80e3ebfb83ad71a82ece1a20f1e2')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
