# Maintainer: Daniel Perez

pkgname=entire-graph-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Entity-level semantic code intelligence plugin for Entire CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/entireio/entire-graph'
license=('MIT')
depends=('entire-cli>=0.10.0' 'git>=2.36')
provides=('entire-graph')
conflicts=('entire-graph')
options=('!debug')
source_x86_64=("entire-graph-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/entire-graph_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("entire-graph-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/entire-graph_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('24e3edef9d580158e4f125c50950fc4a41865b975d32ab4142d944c88eb9bc95')
sha256sums_aarch64=('d2aecc39e886bd8a8a3616a8c8af4fcf6764e31b90975c4f3fdb5af5e873bf98')

package() {
  install -Dm755 entire-graph "$pkgdir/usr/bin/entire-graph"
  install -Dm644 entire-plugin.yml "$pkgdir/usr/share/entire-graph/entire-plugin.yml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
