# Maintainer: sougstron
pkgname=kanban4ai-bin
pkgver=0.4.4
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
sha256sums_x86_64=('438fbcb08e7a91fa92e4d406ee883c9181f37a49b2db1fca13af7e43876d0958')
sha256sums_aarch64=('7ae1e367df688cd8262189f1fad587e5deed97ed31d5ca95ab4264d40c728106')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/kanban4ai-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

package() {
  local release_dir="kanban4ai-v$pkgver-$CARCH-unknown-linux-gnu"

  install -Dm755 "$release_dir/kanban4ai" "$pkgdir/usr/bin/kanban4ai"
  ln -s kanban4ai "$pkgdir/usr/bin/kanban"
  ln -s kanban4ai "$pkgdir/usr/bin/kb"
  install -Dm644 "$release_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$release_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
