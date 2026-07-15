# Maintainer: sougstron
pkgname=kanban4ai-bin
pkgver=0.2.3
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
sha256sums_x86_64=('9987aa78ea84289c11dea8c536cdb712a4b8b7a25a1652c6814065a27be4de98')
sha256sums_aarch64=('d95864e1cf944a9c5a060a675086cf468bf9a9e408d1764dd5c12e9b10175d4c')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/kanban4ai-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

package() {
  local release_dir="kanban4ai-v$pkgver-$CARCH-unknown-linux-gnu"

  install -Dm755 "$release_dir/kanban4ai" "$pkgdir/usr/bin/kanban4ai"
  ln -s kanban4ai "$pkgdir/usr/bin/kanban"
  ln -s kanban4ai "$pkgdir/usr/bin/kb"
  install -Dm644 "$release_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$release_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
