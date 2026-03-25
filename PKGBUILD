# Maintainer: 5c0 <admin@5c0.io>
pkgname=metropolis
pkgver=0.1.2
pkgrel=1
pkgdesc="The cyberpunk system monitor for your terminal."
arch=('x86_64' 'aarch64')
url="https://github.com/5c0/metropolis"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b6d624b769ad4bd7e5c672e0db4da3879f2da2b17ab5c788895e18e2cbbcd054')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
