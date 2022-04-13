# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Network, Service & Security Observability for Kubernetes using eBPF'
arch=('x86_64' 'aarch64')
url='https://cilium.io/'
license=('Apache')
makedepends=()
provides=("cilium-cli=${pkgver}")
conflicts=('cilium-cli')

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cilium/cilium-cli/releases/download/v${pkgver}/cilium-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/cilium/cilium-cli/releases/download/v${pkgver}/cilium-linux-arm64.tar.gz")
sha256sums_x86_64=('3ce0fc26bda230995282235e5b4ea4d1a4747ce67a83c8cd50103faccec40baa')
sha256sums_aarch64=('50f534b4a0d3694aba8af31b862afe9f35c59e1c8a0b45669c6c6112d2e8f396')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/cilium" "$pkgdir/usr/bin/cilium"
}
