# Maintainer: Hundaol Dejen <hundaoldejen1@gmail.com>
pkgname=rsm
pkgver=0.1.0
pkgrel=1
pkgdesc="A safe, fast, and modular symlink manager written in Rust"
arch=('x86_64')
url="https://github.com/hunde32/rsm"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e306866c8055e7dfef004737cb330a34543d3f08ca42205f758fe0959e728870')

build() {
  cd "rsm-$pkgver"
  cargo build --release --locked
}

package() {
  cd "rsm-$pkgver"
  install -Dm755 "target/release/rsm" "$pkgdir/usr/bin/rsm"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
