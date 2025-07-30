pkgname=emqutiti
pkgver=0.1.8
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/goemqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("goemqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('593a07838904383043ed71c5ee7eb6b61182c0ef8796f0eabd7cb855c39bf011')

build() {
  cd "goemqutiti-$pkgver"
  go build -o emqutiti
}

package() {
  cd "goemqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

