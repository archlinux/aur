# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=catbath
pkgver=0.1.5
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

sha256sums_x86_64=('399b4b1fdcbbfdb8d72689119f79941d072626880bf6dc898756037fbfc78d13')
sha256sums_aarch64=('a0fa8318e0da4622554d691993bd5f21a26bbd2d9616b5cefc149601c6b62666')

package() {
  install -Dm755 catbath "$pkgdir/usr/bin/catbath"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 syntax/* -t "$pkgdir/usr/share/$pkgname/syntax"
  install -Dm755 extensions/* -t "$pkgdir/usr/share/$pkgname/extensions"
}
