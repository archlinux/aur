# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=0.8.2
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
sha256sums_x86_64=('e45c85b34d022b17ddb48621583c52b6d86e2e47e6fe71691ee46ff9f89edc27')
sha256sums_aarch64=('b9ace3a77e606ad871577fff79fdf0a068c5c9275ce53ee4d85f218be3cad734')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
