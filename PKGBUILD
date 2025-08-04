pkgname=emqutiti
pkgver=0.1.13
pkgrel=1
pkgdesc="Terminal-based MQTT client written in Go"
arch=('x86_64')
url="https://github.com/marang/emqutiti"
license=('MIT')
depends=()
makedepends=('go')
source=("emqutiti-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f6da3798d669b1fbcb6f2df1b12dc1017c1232466269c6e3da69df9c5f440e0')

build() {
  cd "emqutiti-$pkgver"
  go build -o emqutiti
}

package() {
  cd "emqutiti-$pkgver"
  install -Dm755 emqutiti "$pkgdir/usr/bin/emqutiti"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

