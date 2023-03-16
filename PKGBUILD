# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=to-html
pkgver=0.1.3
pkgrel=1
pkgdesc='Render a terminal with ANSI colors as HTML'
arch=(x86_64)
url="https://github.com/Aloso/$pkgname"
license=(MIT)
depends=(util-linux)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('41add7087f5da43463cdc9a688e5e540743cd1f1ec4cbd7db7e3f03d78bc59d582ca06c7d949396b0d776c05414252e8f7d7d0294f9bd13274a96fd86167838d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
