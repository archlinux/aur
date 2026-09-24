# Maintainer: mAmineChniti <m.aminechniti@gmail.com>
pkgname=sticks-aur
pkgver=0.4.1
pkgrel=1
pkgdesc="A tool for managing C and C++ projects"
arch=('x86_64')
url="https://github.com/mAmineChniti/sticks"
license=('MIT')
depends=('gcc')
makedepends=('rust' 'cargo')
source=("sticks-$pkgver.tar.gz::https://github.com/mAmineChniti/sticks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13e2ce57e9e841d180bca35a3b065184f9306ac5df3d1c2d24aa27648f620137')

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
