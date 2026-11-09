#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=context-bin
pkgver=1.1.0
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
sha256sums_x86_64=('61ca0d7c2870f4e7b15d7f007021a51d16d45bbfc4ad4b2ff461b93b058602ac')
sha256sums_aarch64=('7ce354ab69553229f7e7e070e752e6793060b305b0768b6e2b3ea3c9a2a871a6')

package() {
  install -Dm755 context "$pkgdir/usr/bin/context"
  install -Dm644 context.bash "$pkgdir/usr/share/bash-completion/completions/context"
  install -Dm644 context.fish "$pkgdir/usr/share/fish/vendor_completions.d/context.fish"
  install -Dm644 _context "$pkgdir/usr/share/zsh/site-functions/_context"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
