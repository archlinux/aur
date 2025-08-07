pkgname=emqutiti
pkgver=0.3.2
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/emqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5233f66b6c15db7a700f908c6ae8eedcea948e82782d11026c0b39b44b81199')

build() {
  cd "emqutiti-$pkgver"
  go build -o emqutiti
}

package() {
  cd "emqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

