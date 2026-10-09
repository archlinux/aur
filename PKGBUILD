# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.11.1
pkgrel=1
pkgdesc="LeanCTX Engine — open-source Context Gateway for AI Systems. Context selection, supported controls, and evidence through local integration paths. (pre-built binary)"
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
sha256sums_x86_64=('08d9805c0405fdfebcd79c2deaeb6932f4d2b893b19241c3fc92fa64150ccbc0')
sha256sums_aarch64=('eea041a75919f600b5ef6cd6da35240bed2bfa6e5d7019a8e092f766428cd9ab')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}

