# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=greetd-wlgreet
pkgver=0.4
pkgrel=1
pkgdesc="Wayland greeter for greetd"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/wlgreet"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/wlgreet/archive/$pkgver.tar.gz")
sha256sums=('b3fcb7179a3ebf791b38538a4af99d6b2ec38d15b86ce0d04ffd61cc310049ec')
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
