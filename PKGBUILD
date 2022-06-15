# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.11.8
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
sha256sums_x86_64=('5dd9def881b099334134491f34f4f40c290f3ec95b9b71e95e78171f91730bac')
sha256sums_aarch64=('17d65c9b3ff70412a85d78bdddb4ca3b4172942c2bba94a2c5c8b658665589da')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/cilium" "$pkgdir/usr/bin/cilium"
}
