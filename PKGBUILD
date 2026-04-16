# Maintainer: izz <kui@eeu.jp>
pkgname=wallpaper-picker
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI wallpaper selector with matugen theming support"
arch=('x86_64')
url="https://github.com/kuisux/wallpaper-picker"
license=('MIT')
depends=('matugen')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
