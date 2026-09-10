#!/bin/sh
# Maintainer: Aidan Timson (Timmo) <aidan@timmo.dev>
pkgname=repo-notes-bin
pkgver=20260910.0
pkgrel=1
pkgdesc="Standalone CLI and MCP server for repository notes (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/timmo001/notes"
license=('Apache-2.0')
depends=('glibc' 'git')
provides=('repo-notes')
conflicts=('repo-notes' 'repo-notes-git')
options=('!strip')
install=repo-notes.install
source=('notes.bash' 'notes.fish' '_notes' 'LICENSE')
source_x86_64=("repo-notes-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/repo-notes-${pkgver}-linux-${CARCH}.tar.gz")
source_aarch64=("repo-notes-${pkgver}-linux-${CARCH}.tar.gz::$url/releases/download/${pkgver}/repo-notes-${pkgver}-linux-${CARCH}.tar.gz")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('a62de07c0407ee36467a570da9e6ed936d68b933e226307175fbbc1b2c8c79b8')
sha256sums_aarch64=('d7c7087bae9457fd476533ec709a4fcf8dbc3a479d18fcf33235eec6ccaf46d3')

package() {
  install -Dm755 notes "$pkgdir/usr/bin/notes"
  ln -s notes "$pkgdir/usr/bin/note"
  ln -s notes "$pkgdir/usr/bin/handoffs"
  ln -s notes "$pkgdir/usr/bin/handoff"
  install -Dm644 notes.bash "$pkgdir/usr/share/bash-completion/completions/notes"
  install -Dm644 notes.fish "$pkgdir/usr/share/fish/vendor_completions.d/notes.fish"
  install -Dm644 _notes "$pkgdir/usr/share/zsh/site-functions/_notes"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
