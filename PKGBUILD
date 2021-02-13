# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet
pkgver=0.3
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/wlgreet/archive/$pkgver.tar.gz")
sha256sums=('f66d5942c285ffe51b879883a714a88719197687de242090f47535e495c0c6da')
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
