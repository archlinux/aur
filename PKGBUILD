# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gps-share
pkgver=0.3.1
pkgrel=2
pkgdesc='Utility to share your GPS device on local network'
url='https://github.com/zeenix/gps-share'
license=('GPL2')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('dbus')
makedepends=('cargo')
source=("https://github.com/zeenix/gps-share/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('e2552b99169b7e914c225362db1b58cea0e7b0fb22340b1f6a7969f96a7fc497f921241a60166ed4712353de0808e99a859b7e270e9452963e5b86e913a1a949')

build() {
  export CARGO_HOME="$srcdir"
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
}
