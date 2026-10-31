#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=1.0.1
epoch=1
pkgrel=1
pkgdesc="Standalone CLI and MCP server for deterministic repository context (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/context"
license=('Apache-2.0')
depends=('glibc' 'git')
provides=('context')
conflicts=('context' 'context-git')
options=('!strip')
source=('context.bash' 'context.fish' '_context' 'LICENSE')
source_x86_64=("context-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/context-${pkgver}-linux-${CARCH}.tar.gz")
source_aarch64=("context-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/context-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('0e4278b69db8e0bfba4c4143a15b06f5ae2eac4f7b4f1d1ad46427e466b00ce8')
sha256sums_aarch64=('fc92e4a4d3136d9a98bca8a74e7da0eb48e1c2c64bcbe6e888b23f8b7e8263b1')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
