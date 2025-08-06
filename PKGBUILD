pkgname=emqutiti
pkgver=0.3.1
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/emqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c9f28c1f1f788986f84da6fbec02faebefd299317b41ccb8a0f3d8d37c6efb9')

build() {
  cd "emqutiti-$pkgver"
  go build -o emqutiti
}

package() {
  cd "emqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

