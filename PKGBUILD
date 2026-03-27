# Maintainer: croaky-fx <217624563+croaky-fx@users.noreply.github.com>
pkgname=oxiclean
pkgver=1.0.3
pkgrel=1
pkgdesc="Fast Cross-Distribution Linux System Cleaner written in Rust"
arch=('x86_64')
url="https://github.com/croaky-fx/oxiclean"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
