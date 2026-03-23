# Maintainer: Max Emil Yoon Blomstervall <max.blomstervall@gmail.com>
pkgname=kanban
pkgver=0.3.5
pkgrel=1
pkgdesc="Terminal-based kanban board with MCP server integration"
arch=("x86_64")
url="https://github.com/fulsomenko/kanban"
license=("Apache-2.0")
makedepends=("rust" "cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/fulsomenko/kanban/archive/v$pkgver.tar.gz")
sha256sums=("bee0a6d589665101fbc7d68c448230dd18be8f0f0887ae91f88718f2dcc94041")

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --bin kanban
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/kanban" "$pkgdir/usr/bin/kanban"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
