pkgname=hulios-git
pkgver=1.0
pkgrel=1
pkgdesc="HULIOS - Rust-based transparent Tor proxy for Linux with full system traffic routing, DNS leak protection, and enhanced privacy"
arch=('x86_64')
url="https://github.com/ghaziwali/Hulios"
license=('GPL')
depends=('tor') # Add Tor
makedepends=('git' 'rust' 'cargo')
source=("git+https://github.com/ghaziwali/Hulios.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Hulios"
  cargo build --release
}

package() {
  cd "$srcdir/Hulios"
  install -Dm755 target/release/hulios "$pkgdir/usr/bin/hulios"
}
