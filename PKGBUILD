#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=20260929.1
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
source_x86_64=("context-${pkgver}-linux-x86_64.tar.gz::$url/releases/download/${pkgver}/context-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("context-${pkgver}-linux-aarch64.tar.gz::$url/releases/download/${pkgver}/context-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('93b3f1be0dae56b29c0b8f453bf9c1834aa59d530d5bbe2a97e8a3362f433ac1')
sha256sums_aarch64=('2d37ed321fc53a38d649fea96ec2ffec5ff734169f146c40949e8d709a55f9b0')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
