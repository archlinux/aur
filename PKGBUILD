# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=asciinema-rs
pkgver=0.5.0
pkgrel=1
pkgdesc='Terminal recording and playback client for asciinema.org'
arch=('x86_64')
url=https://github.com/LegNeato/asciinema-rs
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
provides=('asciinema')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5edae6e80c01198e81cb7774df10b0be9cc456389fb539e879266ca26506594002f05d7fa8a4bc960ce44e4cadd3ef086ddc5d607754dbda33c8b51eb19ba742')

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
  install -Dm755 target/release/asciinema "$pkgdir"/usr/bin/asciinema
}

# vim:set ts=2 sw=2 et:
