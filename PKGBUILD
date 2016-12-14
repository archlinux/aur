# Maintainer: Jan Tojnar <jtojnar@gmail.com>
pkgname=sman
pkgver=0.1.0
pkgrel=1
pkgdesc='Utility for selecting manpage section to be opened'
url='https://github.com/jtojnar/sman'
depends=('ncurses')
makedepends=('cargo')
license=('MIT')
source=("https://github.com/jtojnar/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2003ad848c1c783736332f6cf4930083ae920c988f9a041034bfe6522c058036')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
