# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=engram
pkgname=engram-bin
pkgver=3.0.0
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
sha256sums_x86_64=('22bbfd81ee9071a04d446f653842c383a3101b594e8829519a63a7c747602e69')
sha256sums_aarch64=('69c717dfbf10733af0493c706954f40e37cf6545687c2c1903e4b1462c16cdad')
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
