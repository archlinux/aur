pkgname=emqutiti
pkgver=0.1.9
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/goemqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("goemqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f33c2a8e8a11ed343da10eca453305145f39e793a6b650e91db7aab99579c43')

build() {
  cd "goemqutiti-$pkgver"
  go build -o emqutiti
}

package() {
  cd "goemqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

