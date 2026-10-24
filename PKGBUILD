# Maintainer: Daniel Perez

pkgname=entire-graph-bin
pkgver=0.5.0
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
sha256sums_x86_64=('0ce190bd928293f98314f8d6b470218a96b432741b72df0d7869c8956f393da7')
sha256sums_aarch64=('776023435e85f3eefa22eb468c0e3dd926718629dcbcac455311d98754c91a08')

package() {
  install -Dm755 entire-graph "$pkgdir/usr/bin/entire-graph"
  install -Dm644 entire-plugin.yml "$pkgdir/usr/share/entire-graph/entire-plugin.yml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
