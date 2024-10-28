# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.16.3
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
sha256sums_x86_64=('edb6385d3a5042b722b6919e4d81d373e71a762e9f84a71861b9556b80086104')
sha256sums_aarch64=('245125c810bdc46cb04b49cf9a3bf72c7fe6e40daaac1cfc5711e8cb632af56c')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
