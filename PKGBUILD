# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=vivid
pkgver=0.3.0
pkgrel=1
pkgdesc='LS_COLORS manager with multiple themes'
arch=('x86_64')
url=https://github.com/sharkdp/vivid
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('cbf9f5cad9f6c68c889da61ea7184bc9c61c45e49c8346533591409dcabb6c8943d0516e0fc06ceac330fe85c0cbf013f995e62b4eb77c02b7518a3f9699d063')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/vivid
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/config config/*
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/themes themes/*
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
