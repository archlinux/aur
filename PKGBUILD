# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=engram
pkgname=engram-bin
pkgver=1.9.1
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
sha256sums_x86_64=('ebc2e457d8c09da36f769820190d2bf86832ee90586f1228eede6c101a5c1378')
sha256sums_aarch64=('9dcce70a20203714378ffa691bd16a50aa5f3c064eccc0b773bd4662e2ddd5ed')

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
