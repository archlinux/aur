# Maintainer: 5c0 <admin@5c0.io>
pkgname=metropolis
pkgver=0.1.3
pkgrel=1
pkgdesc="The cyberpunk system monitor for your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/5c0/metropolis"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('47c1ed75e2d8f3d9f75927cdead1dc68127eb444ed34eb66284e8150e2d29ab9')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
