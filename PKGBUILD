# Maintainer: Alexander Tagirov [aur @tagirov.cc]

pkgname=rusk
pkgver=0.6.3
pkgrel=1
pkgdesc="A minimal cross-platform terminal task manager written in Rust"
arch=("x86_64")
url="https://github.com/tagirov/rusk"
makedepends=("rust")
license=("GPL-3.0-or-later")
depends=('gcc-libs')
source=("rusk-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4368e23883478ced8f8ec7f7c9110d07c978c78e785a877aab6eb98428c8e2a8')
options=('!debug')

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
