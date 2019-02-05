# Maintainer: Jan Ole Zabel <joz@spline.de>
pkgname=ram
pkgver=0.1.1
pkgrel=0
pkgdesc="Rust AUR Manager – an AUR manager and pacman wrapper written in rust"
arch=('x86_64')
url="https://gitlab.spline.inf.fu-berlin.de/gordon/ram"
license=('GPLv3')
#depends=('gcc-libs')
makedepends=('cargo')
source=("https://gitlab.spline.inf.fu-berlin.de/gordon/ram/-/archive/v$pkgver/ram-v$pkgver.tar.gz")
sha512sums=('1fb1fe394f05765be7a357cc64684ddf55c425ebe0e82e9e538254f9d226588a4801ec7110b8c150515363fbbf2148ab63cef42db6fe0c60aa3c981d8e659499')

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


