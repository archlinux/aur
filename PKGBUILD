pkgname=emqutiti
pkgver=0.1.10
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/goemqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("goemqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b83357e084d383faffc212c28ef465944a662a68abd114ff7477bf40e4c2bb04')

build() {
  cd "goemqutiti-$pkgver"
  go build -o emqutiti
}

package() {
  cd "goemqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

