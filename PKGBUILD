# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=catbath
pkgver=0.1.2
pkgrel=1
pkgdesc="a tiny terminal text editor with search, undo, mouse."
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/catbath"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$url/releases/download/v$pkgver/catbath-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$url/releases/download/v$pkgver/catbath-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('d2e5d62f6d4969d56f91fe63b1ebe5af7a3616624d5e739ef3b71c5d593e1bef')
sha256sums_aarch64=('7e10f4871c98e95b075ff336117890907f5d6b14eae7a19ae4dd1ad37fc55f75')

package() {
  install -Dm755 catbath "$pkgdir/usr/bin/catbath"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 syntax/* -t "$pkgdir/usr/share/$pkgname/syntax"
}
