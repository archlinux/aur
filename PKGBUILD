# Maintainer: Yves Gugger <yves@pounce.ch>
pkgname=lean-ctx-bin
pkgver=1.8.1
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
sha256sums=('1c61e4257e2a891f868f0a27fbe380e0d853a10acc1feb943d2689a292adbacf'
            'SKIP')

package() {
  install -Dm755 "lean-ctx" "$pkgdir/usr/bin/lean-ctx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
