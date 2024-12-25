# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.16.5
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
sha256sums_x86_64=('69bda7e20af338ab7294bfec907d832e4fcc44e61803f84805a7723d3ae6dac3')
sha256sums_aarch64=('05d997a87bf321d2c8e6b4f296e36b7de0d78f51f9ccd25793a0c6b86b29c6bd')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
