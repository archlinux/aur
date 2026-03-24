# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Hybrid Context Optimizer — reduces LLM token consumption by up to 99%. MCP Server + Shell Hook + 75+ CLI compression patterns + tree-sitter AST (14 languages). (pre-built binary)"
arch=('x86_64')
url="https://leanctx.com"
license=('MIT')
depends=('gcc-libs')
provides=('lean-ctx')
conflicts=('lean-ctx')
source=("lean-ctx-$pkgver.tar.gz::https://github.com/yvgude/lean-ctx/releases/download/v$pkgver/lean-ctx-x86_64-unknown-linux-gnu.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/yvgude/lean-ctx/v$pkgver/rust/LICENSE")
sha256sums=('4ea681cec17ad204c269731ee1e2b81e89034f878ea6e95a7c76d65e86cea957'
            'SKIP')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
