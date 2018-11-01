# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=dup-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal, fast alternative to 'du -sh'"
arch=('x86_64')
url=https://github.com/sharkdp/dup
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("dup-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8f45c48bfe3acc3d147ab689c825680549b3e3321ceebab66dbe17b90a48dd98e548d879e22df75de5660af40689416426237f2354f26d592c76a174cfd0c3fe')

build() {
  cd dup-$pkgver
  cargo build --release
}

package() {
  cd dup-$pkgver
  install -Dm755 target/release/dup "$pkgdir"/usr/bin/dup
  install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/dup-rs/LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
