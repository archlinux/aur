# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.17.2
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
sha256sums_x86_64=('b048e73ee39ce1a46730460362afb14e08cf9edf2c541ab9dd8f2aadcb350ddc')
sha256sums_aarch64=('0d2252b80ef5bb956dc8ae86c9a96b45ed85200b2818cbd69249a5a3a3b33e40')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
