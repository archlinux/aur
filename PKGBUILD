# Maintainer: Alexander Tagirov [aur @tagirov.cc]

pkgname=rusk
pkgver=0.7.3
pkgrel=1
pkgdesc="A minimal cross-platform terminal task manager written in Rust"
arch=("x86_64")
url="https://github.com/tagirov/rusk"
makedepends=("rust")
license=("GPL-3.0-or-later")
depends=('gcc-libs')
source=("rusk-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b8d10e8ff4b8e3002d13d6e2b2e79baaa2e42ce8721b4e31f70361c968f930a5')
options=('!debug')
install=rusk.install

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/rusk "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
