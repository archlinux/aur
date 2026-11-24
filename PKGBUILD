# Maintainer: mAmineChniti <m.aminechniti@gmail.com>
pkgname=sticks-aur
pkgver=0.6.0
pkgrel=1
pkgdesc="A tool for managing C and C++ projects"
arch=('x86_64')
url="https://github.com/mAmineChniti/sticks"
license=('MIT')
depends=('gcc')
makedepends=('rust' 'cargo')
source=("sticks-$pkgver.tar.gz::https://github.com/mAmineChniti/sticks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7b2744268136f35c24688cc989420d1995733e03be82cce0e3871e79ec64f3dd')

build() {
	cd "sticks-$pkgver"
	export CARGO_TARGET_DIR=target
	cargo build --release --locked --all-features
}

package() {
	cd "sticks-$pkgver"
	install -Dm755 "target/release/sticks" "$pkgdir/usr/bin/sticks"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sticks-aur/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/sticks-aur/README.md"
}
