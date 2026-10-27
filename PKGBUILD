# Maintainer: Daniel Perez

pkgname=entire-graph-bin
pkgver=0.6.0
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
sha256sums_x86_64=('b1600fdfb6dfbbc1bd0b53ee319c6db87b5af5804206a6f7b1a105f3e97b87ca')
sha256sums_aarch64=('f11f38f2b8625f83f911a177e7667648e01a37e7174b4fc1c36c392469c13c97')

package() {
  install -Dm755 entire-graph "$pkgdir/usr/bin/entire-graph"
  install -Dm644 entire-plugin.yml "$pkgdir/usr/share/entire-graph/entire-plugin.yml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
