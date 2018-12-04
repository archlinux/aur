# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=vivid
pkgver=0.4.0
pkgrel=1
pkgdesc='LS_COLORS manager with multiple themes'
arch=('x86_64')
url=https://github.com/sharkdp/vivid
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('debef0a9a46b4afee3bee96fa3f877525d0208395adbe5ac70ba37da81037243839f2dd180749cf4e2c1c1824ebe76d4edab5b1e80aa8cf99339bdd7552b1a77')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin target/release/vivid
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname config/*
  install -Dm644 -t "$pkgdir"/usr/share/$pkgname/themes themes/*
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE-MIT
}

# vim:set ts=2 sw=2 et:
