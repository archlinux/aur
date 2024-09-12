# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.16.1
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
sha256sums_x86_64=('3acb2efa15b0f69191ed4b8ca4fe18fc14b6f5d07243f2e4dd459480508f78e4')
sha256sums_aarch64=('ddd0a3a8529b8678f0dddff876b021010b5efdeaef20ccc7ca751f3a4a07f741')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
