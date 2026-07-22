#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=20260722.0
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
sha256sums_x86_64=('88d53842da25f736fa4413c8ff7af0731b636c6155b702c3357e7afaf2d079c2')
sha256sums_aarch64=('e5cd77045530ec66085dbda35f927875dcd3836ac8012df3163ea670a2bae85e')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
