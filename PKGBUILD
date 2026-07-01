# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.8.18
pkgrel=1
pkgdesc="Context Engineering Layer for AI Coding — 77 MCP tools, 10 read modes, 95+ shell patterns, persistent knowledge, multi-agent orchestration. Privacy-first, opt-in only. (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://leanctx.com"
license=('Apache-2.0')
# onnxruntime: semantic search loads libonnxruntime.so at runtime (ort's
# `load-dynamic`); the pre-built binary resolves it from /usr/lib.
depends=('gcc-libs' 'onnxruntime')
provides=('lean-ctx')
conflicts=('lean-ctx')
source_x86_64=("lean-ctx-$pkgver-x86_64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("lean-ctx-$pkgver-aarch64.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('7034281ffe13f3fe3a2a1564db5c217870788a96d406838692c4fec0ecd1ccbb')
sha256sums_aarch64=('d593bd14786bee7ceb7e3667f0a399e41a446a17a8fcfd2fa8cf6100cdfeceea')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}

