# Maintainer: Michi <michael.h.25511@proton.me>
pkgname=filec
pkgver=1.0.0
pkgrel=2
pkgdesc="Multithreaded file size counter"
arch=('x86_64')
url="https://codeberg.org/MichiDexi/filec"
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
