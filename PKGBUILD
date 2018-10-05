# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=toastify
pkgver=0.3.0
pkgrel=1
pkgdesc='Commandline tool that shows desktop notifications using notify-rust'
arch=('x86_64')
url=https://github.com/hoodie/toastify
license=('unknown')
depends=('dbus')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ae58f28fed37e5edf48d9f0bd32eb9501acc9d7a04bd5bd2c13ce6e12cf0413b67118e155ae6afc21f6adcee041c9b76488d934f35c84efef983a43f2ec174fa')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
