# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=gimji
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal local-first notes for projects, tasks, boards, calendars, and markdown"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/gimji"
license=('MIT')
depends=('gcc-libs')
makedepends=()
options=(!strip)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gimji-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gimji-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('ad3c3560bbd22c9c550919fa3c881d8fe7f7947b66bb24290505165598f3d9a1')
sha256sums_aarch64=('51943782c95e9c3a040dd2ac967f26c2ed5953daae13f53c6c15ef1bf09fc51a')

package() {
  install -Dm755 gimji "$pkgdir/usr/bin/gimji"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
