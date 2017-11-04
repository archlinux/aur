pkgname=cargo-script
pkgver=0.2.9
pkgrel=1
pkgdesc="Quickly and easily run Rust \"scripts\""
url="https://github.com/DanielKeep/cargo-script"
depends=('cargo' 'rust')
arch=('i686' 'x86_64')
license=('MIT')
source=("git+https://github.com/DanielKeep/cargo-script.git#commit=614e60e5932e218ebff1e471303eb0d59870d03b")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"

  install -Dm755 target/release/run-cargo-script "$pkgdir/usr/bin/run-cargo-script"
  install -Dm755 target/release/cargo-script "$pkgdir/usr/bin/cargo-script"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
