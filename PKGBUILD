# Maintainer: Jonathan Wright <jon@than.io>

pkgname=cilium-cli-bin
pkgver=0.8.4
pkgrel=2
pkgdesc='Network, Service & Security Observability for Kubernetes using eBPF'
arch=('x86_64' 'aarch64')
url='https://cilium.io/'
license=('Apache')
makedepends=()
provides=("cilium-cli=${pkgver}")
conflicts=('cilium' 'cilium-bin' 'cilium-git')

source_x86_64=("${pkgname}-${pkgver}-amd64.tar.gz::https://github.com/cilium/cilium-cli/releases/download/v${pkgver}/cilium-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-arm64.tar.gz::https://github.com/cilium/cilium-cli/releases/download/v${pkgver}/cilium-linux-arm64.tar.gz")
sha256sums_x86_64=('f638a4fd7582c985a893b8f61bd25bfcc47f28f590256aa301ee167f86a5f232')
sha256sums_aarch64=('3f444d626c9ae0fefaaf019da099f820c5bb5ee65f02e40533811371b6715ec5')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/cilium" "$pkgdir/usr/bin/cilium"
}
