# Maintainer: sougstron
pkgname=kanban4ai-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Native kanban board CLI and TUI driven by AI coding agents (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/sougstron/kanban4ai'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("kanban4ai=$pkgver")
conflicts=('kanban4ai')
options=('!strip')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/kanban4ai-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8dc143c42caa344e796a1e9bd0ce12ba8a3998c20c27131863ce2448587e8d3a')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/kanban4ai-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('b989af160a8729cd77cf3c2ac11d16c5dca232eeab2ab3a6c6a6f241dfa7987c')

package() {
  local release_dir="kanban4ai-v$pkgver-$CARCH-unknown-linux-gnu"

  install -Dm755 "$release_dir/kanban4ai" "$pkgdir/usr/bin/kanban4ai"
  ln -s kanban4ai "$pkgdir/usr/bin/kanban"
  ln -s kanban4ai "$pkgdir/usr/bin/kb"
  install -Dm644 "$release_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$release_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
