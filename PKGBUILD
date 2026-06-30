# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.8.16
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
sha256sums_x86_64=('1a590a4e00f85a2802888bb89264f790d35b9c3f579ec8d75b387cf1b7897c36')
sha256sums_aarch64=('49033754b39807250bc6f4d48d88eef678228950627683b093e24a431527893c')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}
