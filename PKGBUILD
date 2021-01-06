# Maintainer: Rehan Rana <rehanalirana@tuta.io>

pkgname=dyn-wall-rs
pkgver=2.1.2
pkgrel=2
pkgdesc='A utility to allow you to set a dynamic wallpaper and more.'
arch=('x86_64')
url='https://github.com/RAR27/dyn-wall-rs'
license=('GPL3')
makedepends=('rust')
optdepends=('feh: for setting wallpapers for window managers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('934e54eb77427f31d2f6b3ca0dc5903aefafc2d52cde47747fa879959718bc55')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
