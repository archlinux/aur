# Maintainer: Jonathan Wright <jon@than.io>

pkgname=hubble-bin
pkgver=1.20.4
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
sha256sums_x86_64=('78ed68bd56d244bf2691ae4ba186d78e87e6814df58573d6de6089d0e5d7ddd8')
sha256sums_aarch64=('cccecf20e204c0bcbb2635c5efc9672fea0e33a58d01f04e94324caddb572250')

options=("!strip")

package() {
  install -D -g root -m 0755 -o root "$srcdir/hubble" "$pkgdir/usr/bin/hubble"
}
