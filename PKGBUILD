# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=engram
pkgname=engram-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Persistent memory system for AI coding agents - SQLite + FTS5 with MCP server, HTTP API, CLI, and TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/engram"
license=('MIT')
depends=()
provides=("engram=$pkgver")
conflicts=(engram)
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/Gentleman-Programming/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-linux-amd64.tar.gz::https://github.com/Gentleman-Programming/$_pkgname/releases/download/v$pkgver/engram_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-arm64.tar.gz::https://github.com/Gentleman-Programming/$_pkgname/releases/download/v$pkgver/engram_${pkgver}_linux_arm64.tar.gz")
sha256sums=('09608597ddda4e5f9033ac407a0d401986d96376c47f6d46789ca38db672dc15')
sha256sums_x86_64=('3579cf5d92ae9349c6941ff08cde04012b12c9c695d307e71afaee4fb5e4a9c1')
sha256sums_aarch64=('12b84e62a9763290d086efc0332dfbd9ebe2f3ff7461c44ed091c9f946d2f0cc')
options=('!debug')

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 engram "$pkgdir/usr/bin/engram"

  # Install cloud-sync helper scripts
  install -Dm755 -t "$pkgdir/usr/share/$_pkgname/tools" tools/*

  # Install license
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
