# Maintainer: meowrain <meowrain@126.com>
# Contributor: ilius <saeedgnu@riseup.net>

pkgname=localsend-go
pkgver=1.2.5
pkgrel=1
pkgdesc="CLI implementation of LocalSend protocol in Go"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/meowrain/localsend-go"
license=('MIT')
depends=('glibc')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('48d6b94b7cbcf6b07400c7293401a0d329e15c6ab1f3493e31363a5525e73b00')

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname" "cmd/main.go"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
