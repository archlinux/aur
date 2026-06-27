# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=catbath
pkgver=0.1.6
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

sha256sums_x86_64=('2b7649abfa967f3a546f4d0c3b7d4d01bb278fdbf200321263607e598a1b4c52')
sha256sums_aarch64=('7b83fd167d0aad51caa4d9c4ceda6f781be0b254063401cadbd7ced4983ac20a')

package() {
  install -Dm755 catbath "$pkgdir/usr/bin/catbath"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 syntax/* -t "$pkgdir/usr/share/$pkgname/syntax"
  install -Dm755 extensions/* -t "$pkgdir/usr/share/$pkgname/extensions"
}
