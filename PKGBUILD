# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.12.3
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
sha256sums_x86_64=('f87b0ce1b0264d9a6218609e7df20003e0667d3183ae6d4a77a702bb14f19b63')
sha256sums_aarch64=('2d1491cdaf594f0bd0d45d70d815c2526e379d47e40274650474dbd27c192e06')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
