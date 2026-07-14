# Maintainer: DylanZM <dylanzm@users.noreply.github.com>

pkgname=poketui
pkgver=0.1.0
pkgrel=1
pkgdesc="A Pokémon Pokédex TUI built with Go and Bubble Tea"
arch=('x86_64' 'aarch64')
url="https://github.com/DylanZM/Poke-Tui"
license=('MIT')
makedepends=('go')
source=("$pkgname::git+https://github.com/DylanZM/Poke-Tui.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  go build -o poketui -ldflags="-s -w" .
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 poketui "$pkgdir/usr/bin/poketui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
