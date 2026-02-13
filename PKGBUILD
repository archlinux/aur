# Maintainer: Amane Kai
pkgname=valentine-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="A playful terminal-based Valentine's Day proposal app"
arch=('x86_64')
url="https://github.com/Floranaras/funnyvalentine"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Floranaras/funnyvalentine/archive/v$pkgver.tar.gz")
sha256sums=('085d93f86de8654b8abaed0cc92e8cb12bf0949c259d5ef31ebe0956f71fe262')

build() {
  cd "funnyvalentine-$pkgver"
  cargo build --release --locked
}

package() {
  cd "funnyvalentine-$pkgver"
  install -Dm755 target/release/valentine-tui "$pkgdir/usr/bin/valentine-tui"
}
