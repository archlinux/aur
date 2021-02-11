# Maintainer: Robert Plant <rob@robertplant.io>

pkgname=paswitch-rs
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="List and swap to pulse sinks by name"
license=('GPL3')
depends=('pulseaudio' 'paswitch')
provides=('paswitch-rs')
url=https://github.com/RobertPlant/paswitch-rs
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('2ce686fb793fac36527eba9727cd46891da29a78a2694f6e1c77acc37eabb8e4f75599a75e7919882226909dd254c5a9b0d71c14c755832f67f57ff326d23dbe')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

check() {
  cd $pkgname-$pkgver
  cargo test --release
}

package() {
  cd $pkgname-$pkgver
  cargo install --path .
}
