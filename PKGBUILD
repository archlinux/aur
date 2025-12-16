# Maintainer: Alexander Tagirov [aur @tagirov.cc]

pkgname=rusk
pkgver=0.6.2
pkgrel=1
pkgdesc="A minimal cross-platform terminal task manager written in Rust"
arch=("x86_64")
url="https://github.com/tagirov/rusk"
makedepends=("rust")
license=("GPL-3.0-or-later")
depends=('gcc-libs')
source=("rusk-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2613ca55854022894eeffd74c6ced369df36b1ac3a2d260d7c7d9bc7c05553dc')
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
