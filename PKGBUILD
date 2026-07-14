# Maintainer: DylanZM <dylanzm@users.noreply.github.com>

pkgname=poketui
pkgver=0.1.0
pkgrel=1
pkgdesc="A Pokémon Pokédex TUI built with Go and Bubble Tea"
arch=('x86_64' 'aarch64')
url="https://github.com/DylanZM/Poke-Tui"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DylanZM/Poke-Tui/archive/v$pkgver.tar.gz")
b2sums=('f94a7b6cc0f58ca3eda4dcbd5e306aa9080e7e06ca8f91071a1be739bcca565b75fdfb3bd37037a16da58a9a70115a193e217f4d4be05eb42e74652137549869')

build() {
  cd "$srcdir/Poke-Tui-v$pkgver"
  go build -o poketui -ldflags="-s -w" .
}

package() {
  cd "$srcdir/Poke-Tui-v$pkgver"
  install -Dm755 poketui "$pkgdir/usr/bin/poketui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
