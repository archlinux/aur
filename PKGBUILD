#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=20260913.0
pkgrel=1
pkgdesc="Standalone CLI and MCP server for deterministic repository context (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/context"
license=('Apache-2.0')
keywords=('mcp' 'cli' 'context' 'git' 'agent')
depends=('glibc')
provides=('context')
conflicts=('context' 'context-git')
options=('!strip')
source=('context.bash' 'context.fish' '_context' 'LICENSE')
source_x86_64=("context-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/context-${pkgver}-linux-${CARCH}.tar.gz")
source_aarch64=("context-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/context-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('cc215bb4262009e930862b2c2b139037410bf5c36fd97e5e2e481c9d4001dcb5')
sha256sums_aarch64=('83be2fc4fd475d828cd1596f83b0c9ecb8e1cb4aefdb7cfaff83cda2b89c8322')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
