# Maintainer: Stephen Brennan <stephen@brennan.io>
pkgname=alien-console
pkgver=0.7
pkgrel=1
pkgdesc="A ncurses based clone of the Alien: Isolation console interfaces."
arch=('x86_64')
url="https://github.com/brenns10/alien-console"
license=('GPL')
depends=('ncurses')
source=("https://brenns10.keybase.pub/$pkgname-$pkgver.tar.gz")
sha256sums=('297394cc2a74b0189095f893d331f5ae06839734b65302a5aaf06debeff840d1')

build() {
	cd "$pkgname-$pkgver"
	make release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dvm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	install -Dvm644 etc/* "$pkgdir/usr/share/$pkgname"
}
