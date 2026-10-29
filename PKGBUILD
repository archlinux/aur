# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=3.12.0
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
sha256sums_x86_64=('a91d94c9057c15a94dae147772e7a00ff26bb8566b66501d479eda28eb80a489')
sha256sums_aarch64=('8b35971fae9d1594c76c53dcde87fa67fa104460b9ad73f4d480f25fb3c3b14d')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
}

