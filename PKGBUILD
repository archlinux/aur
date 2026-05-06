# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=engram
pkgname=engram-bin
pkgver=1.15.9
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
sha256sums_x86_64=('3d324d4f07a0fba31afdbc9d7df3a9538e0190bf71c5f0d25c4ecd13b29f3d15')
sha256sums_aarch64=('dce36822e5afb32e190f969ae03ad27f9d1b557fd2e62c87622ee7ded5a65b4a')

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
