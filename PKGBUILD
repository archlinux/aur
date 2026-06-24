# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=catbath
pkgver=0.1.3
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

sha256sums_x86_64=('58d033b614358ce1a9127a08f0484dff61f2d822ad267294a8da6e50239a5977')
sha256sums_aarch64=('7f8709ef2a54d34811ca20794dcbb518286d926a9089af8f71e014fee5c4012b')

package() {
  install -Dm755 catbath "$pkgdir/usr/bin/catbath"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 syntax/* -t "$pkgdir/usr/share/$pkgname/syntax"
  install -Dm755 extensions/* -t "$pkgdir/usr/share/$pkgname/extensions"
}
