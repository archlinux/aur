# Maintainer: Jan Ole Zabel <joz@spline.de>, Philipp Fleischer <deleaf@spline.de>, Enno Strauß <roxc@spline.de>
pkgname=ram
pkgver=0.1.2
pkgrel=2
pkgdesc="Rust AUR Manager – an AUR manager and pacman wrapper written in rust"
arch=('x86_64')
url="https://gitlab.spline.inf.fu-berlin.de/gordon/ram"
license=('GPLv3')
#depends=('gcc-libs')
makedepends=('cargo')
source=("https://gitlab.spline.inf.fu-berlin.de/gordon/ram/-/archive/v$pkgver/ram-v$pkgver.tar.gz")
sha512sums=('23499202ef9c582f32c173b89dac9e9e85504791aaeaa17c47c1f7511d3b98a6ad310e8794fcbdac4ea9e4beb3a5307d4f0223fb42180fdb421279ad851e5a19')

build() {
	cd "ram-v$pkgver"
	cargo update
	cargo build --release
}

package() {
	cd "ram-v$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


