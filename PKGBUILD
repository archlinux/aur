# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=toastify
pkgver=0.3.2
pkgrel=1
pkgdesc='Commandline tool that shows desktop notifications using notify-rust'
arch=('x86_64')
url=https://github.com/hoodie/toastify
license=('Apache' 'MIT')
depends=('dbus')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3fa7d4eb22f64d64fa99bd88239d484679c79630bed97f9205a8910495c78186c880bbae73d1ea0c788b6ee1e7d162c447222933c8d5e7c5ed24a0de64b46952')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
