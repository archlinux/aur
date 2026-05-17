# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=engram
pkgname=engram-bin
pkgver=1.15.13
pkgrel=1
pkgdesc="Persistent memory system for AI coding agents - SQLite + FTS5 with MCP server, HTTP API, CLI, and TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/Gentleman-Programming/engram"
license=('MIT')
depends=()
provides=(engram)
conflicts=(engram)
source_x86_64=("$_pkgname-$pkgver-linux-amd64.tar.gz::https://github.com/Gentleman-Programming/$_pkgname/releases/download/v$pkgver/engram_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-linux-arm64.tar.gz::https://github.com/Gentleman-Programming/$_pkgname/releases/download/v$pkgver/engram_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cf58063be40f558e7b73c48e2c323bc5c092afd41d1745c73a7e5537691ba3c0')
sha256sums_aarch64=('5220dab78842f52acf450239eafa19e278af6e8beec05e18a546bafebaa5f0c0')

prepare() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"

  # Install binary
  install -Dm755 engram "$pkgdir/usr/bin/engram"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
