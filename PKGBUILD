

pkgname=uutils-sed
pkgver=0.2.0
pkgrel=1
pkgdesc="Rust implementation of sed"
arch=('x86_64')
url=https://github.com/uutils/sed
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
#source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
source=("https://static.crates.io/crates/sed/sed-${pkgver}.crate")
b2sums=('6e975e28b8b1689ca191167dbdd3a71200103f46ee31393504d95a556d0ff5cb2ae65a4e7e3150825a6ee595cdd7d2396db9bea938a8f32ab69090377501c728')

build(){
  cd sed-$pkgver
  cargo build --release
}

package() {
  cd sed-$pkgver
  install -Dm755 target/release/sed "$pkgdir"/usr/bin/uu-sed
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
