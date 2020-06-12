# Maintainer: Rehan Rana <rehanalirana@tuta.io>

pkgname=dyn-wall-rs
pkgver=1.1.1
pkgrel=2
pkgdesc='A utility to allow you to set a dynamic wallpaper and more.'
arch=('x86_64')
url='https://github.com/RAR27/dyn-wall-rs'
license=('GPL3')
makedepends=('rust')
optdepends=('feh: for setting wallpapers for window managers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d95e5c743097c4b4744d5deeb2ee9a41017346328adb93866ec9fbd430f5f7bc')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
