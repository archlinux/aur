# Maintainer: Rehan Rana <rehanalirana@tuta.io>

pkgname=dyn-wall-rs
pkgver=2.1.1
pkgrel=1
pkgdesc='A utility to allow you to set a dynamic wallpaper and more.'
arch=('x86_64')
url='https://github.com/RAR27/dyn-wall-rs'
license=('GPL3')
makedepends=('rust')
optdepends=('feh: for setting wallpapers for window managers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cad4621471760707403e5db4c112a4ad2ede659b06a04a1f014463bbcffbcc62')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
