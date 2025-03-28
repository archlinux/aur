# Maintainer: Digua Dong <dongdigua@outlook.com>
pkgname=wl-binclock
pkgver=1.1.1
pkgrel=1
pkgdesc="binary clock for wayland in rust"
arch=('x86_64')
url="https://github.com/dongdigua/wl-binclock"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c85afb31b5010d789eaba2d5e7fefcd4dea9ea8cb3fac6c14cb323bde9ef241c')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
