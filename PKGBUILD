# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=asciinema-rs
pkgver=0.5.1
pkgrel=1
pkgdesc='Terminal recording and playback client for asciinema.org'
arch=('x86_64')
url=https://github.com/LegNeato/asciinema-rs
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
provides=('asciinema')
conflicts=('asciinema')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('59a786a6a82122c33200bc7eb30e96e38548e45eb478eae259fa8ccd601b0bd596d4d9066ce75a5dc95abdaa97554f4a05cc2218b4c228566a65ed510d35c600')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/asciinema
}

# vim:set ts=2 sw=2 et:
