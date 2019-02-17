# Maintainer: Jan Ole Zabel <joz@spline.de>, Philipp Fleischer <deleaf@spline.de>, Enno Strauß <roxc@spline.de>
pkgname=ram
pkgver=0.2.0
pkgrel=0
pkgdesc="Rust AUR Manager – an AUR helper and pacman wrapper written in rust"
arch=('x86_64')
url="https://gitlab.spline.inf.fu-berlin.de/gordon/ram"
license=('GPLv3')
makedepends=('cargo')
depends=('pacman' 'sudo')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('71d3086628e11af4b9aa33392d18e9b8a99a7ac9490da24b42a3d6c238eccb597851b467dc796c8f3c9e6663498f3c0ce5a01b676c40881147523d2d1ba051e6')

build() {
	cd "$pkgname-v$pkgver"
	cargo update
	cargo build --release
}

package() {
	cd "$pkgname-v$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


