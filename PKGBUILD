pkgname=cargo-script
pkgver=0.2.0
pkgrel=1
pkgdesc="Quickly and easily run Rust \"scripts\""
url="https://github.com/DanielKeep/cargo-script"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("git+https://github.com/DanielKeep/cargo-script.git#commit=11ad368ff6dfa862629b2d0864dcaa958caba33f")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/run-cargo-script "$pkgdir/usr/bin/run-cargo-script"
  install -Dm755 target/release/cargo-script "$pkgdir/usr/bin/cargo-script"
}
