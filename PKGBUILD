# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet
pkgver=0.2
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/wlgreet/archive/$pkgver.tar.gz")
sha256sums=('5761d43e4efbf330aca67be387813849ad11e1cd79c2b5d951f83fa09c4d01ef')
makedepends=(rust)

build() {
  cd wlgreet-$pkgver
  cargo build --release
}

check() {
  cd wlgreet-$pkgver
  cargo test --release
}

package() {
  install -d "$pkgdir"/usr/bin
  install -m755 wlgreet-$pkgver/target/release/wlgreet "$pkgdir"/usr/bin/
}
