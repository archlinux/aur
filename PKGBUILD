# Maintainer: Rehan Rana <rehanalirana@tuta.io>

pkgname=dyn-wall-rs
pkgver=2.1.3
pkgrel=1
pkgdesc='A utility to allow you to set a dynamic wallpaper and more.'
arch=('x86_64')
url='https://github.com/RAR27/dyn-wall-rs'
license=('GPL3')
makedepends=('rust')
optdepends=('feh: for setting wallpapers for window managers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2770049adfa0dcaec800bbb1c735cbf63079319ec5ed400193c8a3b3adbd3f34')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 dyn-wall-rs.service "$pkgdir/usr/lib/systemd/system/dyn-wall-rs.service"
}
