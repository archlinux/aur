#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=1.0.0
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
sha256sums_x86_64=('5ee07092e8091b7bd967a437f62f172c920b3aab84a943f5a6f647b3a0531363')
sha256sums_aarch64=('7da1fe5e87b2c51171c73f4821a2ff40efd87243e3b2ab2d2085e749a20c539b')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
