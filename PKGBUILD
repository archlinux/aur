# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.10.2
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
sha256sums_x86_64=('313171d64780d8a27e07e129d2ac34765201a600439e83de73dff55e6dc53b10')
sha256sums_aarch64=('6802a80c1bff04ee24c9d80d1f6c76ca1e1392db274fe062d89e60f7c0525379')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/cilium" "$pkgdir/usr/bin/cilium"
}
