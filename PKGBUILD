# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=toastify
pkgver=0.3.4
pkgrel=1
pkgdesc='Commandline tool that shows desktop notifications using notify-rust'
arch=('x86_64')
url=https://github.com/hoodie/toastify
license=('Apache' 'MIT')
depends=('dbus')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('f75e24b6199e27e7c6225dbf71fff5d322200cbc3c426d71104267e10f865b992af1c1fd18917dc187f2285926763551e4c6941c1021290e2d5ee234420616b4')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/$pkgname
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
