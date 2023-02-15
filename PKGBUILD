# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.11.2
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
sha256sums_x86_64=('fa2b5a1468f17957899063ad2ff1b51c68aae955a2b5d09390174a7b36a80bdb')
sha256sums_aarch64=('7e1496bdc937dcf34de2f282edf62f91edc7ed1435ad78401035dc04e6b66f90')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
