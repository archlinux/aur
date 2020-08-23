# Maintainer: Rehan Rana <rehanalirana@tuta.io>

pkgname=bootstub-updater
pkgver=1.0.0
pkgrel=1
pkgdesc='A utility to facilitate the maintenance of your EFI bootstub.'
arch=('x86_64')
url='https://github.com/RAR27/bootstub-updater'
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f318e65cb3ca8eede7e075f99058f714f47ed2678b53cde3cf50320a37b68a41')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
