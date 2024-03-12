# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.13.2
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
sha256sums_x86_64=('d4872683bc2da5d1175b544452845c56be169c8fef0768d9bd5d710add64bd6b')
sha256sums_aarch64=('0eb69c778e6d64f5587ed5151ebf8d2e85bee23ae4a26282cccc6a97af3f8ad3')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
