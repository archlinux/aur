pkgname=limine-cli
pkgver=0.0.1
pkgrel=1
pkgdesc="CLI tool for managing Limine bootloader"
arch=('x86_64')
url="https://github.com/pigeonhands/limine-cli"
license=('MPL-2.0')
depends=('limine')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
