# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=catbath
pkgver=0.1.4
pkgrel=1
pkgdesc="a tiny editor: terminal-first, browser-curious, extension-friendly."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/catbath"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/catbath-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/catbath-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('37b5c584498e8e5dbbbd4f4821ab836022699bd986f89d20a06c84d87e9e3093')
sha256sums_aarch64=('82d87ee449301d8294839d69154f151ba524725c7cfc6f5e456cea26b2bf36c2')

package() {
  install -Dm755 catbath "$pkgdir/usr/bin/catbath"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 syntax/* -t "$pkgdir/usr/share/$pkgname/syntax"
  install -Dm755 extensions/* -t "$pkgdir/usr/share/$pkgname/extensions"
}
