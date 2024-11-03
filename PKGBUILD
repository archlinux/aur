# Contributor: ilius saeedgnu@riseup.net
# Maintainer: meowrain meowrain@126.com
pkgname=localsend-go
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI for localsend implemented in Go "
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url="https://github.com/meowrain/localsend-go"
license=('MIT')
depends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/meowrain/localsend-go/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ad1178bdf418ef638d3b89dd4faed8c70c18ab56e365eadd8442a362e37f0e9e')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o "$pkgname" "cmd/main.go"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
