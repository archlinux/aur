#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=20260929.2
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
sha256sums_x86_64=('62506c49fe5d8d89abd66fbfb871cf626c9046897b14c126143c4411ab96afbb')
sha256sums_aarch64=('5dd4d327bce9f6e708ff14f12247a90f2a81dc3d0de6d16d7bbd5206950d4d20')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
