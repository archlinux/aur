# Maintainer: mAmineChniti <m.aminechniti@gmail.com>
pkgname=sticks-aur
pkgver=0.3.5
pkgrel=1
pkgdesc="A tool for managing C and C++ projects"
arch=('x86_64')
url="https://github.com/mAmineChniti/sticks"
license=('MIT')
depends=('gcc')
makedepends=('rust' 'cargo')
source=("sticks-$pkgver.tar.gz::https://github.com/mAmineChniti/sticks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2d6fdc329eb962cca67b3c5e01ddd8b25e0874b216d6b1dcd6207161c078e2d')

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
