# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.10.0
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
sha256sums_x86_64=('b421b7cfb8a616d8206fcf725a21a0e168b47e7009a74f4070d7e7cced8ccfad')
sha256sums_aarch64=('dd7dd0dab8c2234517a4f3b3ad1c65d1675f24dfafc6520b513fd088388a284c')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
