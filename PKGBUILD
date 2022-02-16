# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.10.3
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
sha256sums_x86_64=('20437149734116bfa960f98a28fc85de30770280634cf548f8be0a7f4c4ee490')
sha256sums_aarch64=('838ee6c21eaf906ef437a52caa2230dfce6aee4e816675bb064c7b4242dc2b32')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/cilium" "$pkgdir/usr/bin/cilium"
}
