# Maintainer: Alexander Tagirov [aur @tagirov.cc]

pkgname=rusk
pkgver=0.6.11
pkgrel=1
pkgdesc="A minimal cross-platform terminal task manager written in Rust"
arch=("x86_64")
url="https://github.com/tagirov/rusk"
makedepends=("rust")
license=("GPL-3.0-or-later")
depends=('gcc-libs')
source=("rusk-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d5d1f40067cf81847f2902b7679c430bc6d65d5860d1955881411a3c1ecb30b8')
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
