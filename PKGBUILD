# Maintainer: Michi <michael.h.25511@proton.me>
pkgname=lcount
pkgver=0.1.0
pkgrel=1
pkgdesc="Line counter for code and documents"
arch=('x86_64')
url="https://codeberg.org/MichiDexi/lcount"
license=('GPLv3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
