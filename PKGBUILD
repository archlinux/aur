# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet
pkgver=0.4.1
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/wlgreet/archive/$pkgver.tar.gz")
sha256sums=('6abc51625cb8a61959a745bfd56c17963ca4ab33cd79dabe8ad0daeb651b8a13')
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
