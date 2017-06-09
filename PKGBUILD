# Maintainer: Stephen Brennan <stephen@brennan.io>
pkgname=alien-console
pkgver=1.0
pkgrel=2
pkgdesc="A ncurses based clone of the Alien: Isolation console interfaces."
arch=('x86_64')
url="https://github.com/brenns10/alien-console"
license=('BSD')
depends=('ncurses')
optdepends=('alsa-utils: for aplay sound support')
source=("https://github.com/brenns10/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4ec81fb5abc77b28e7678f252fc46653c9fa6f73becc506b7ad968b18c7974b4')

build() {
	cd "$pkgname-$pkgver"
	make release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dvm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/$pkgname"
	install -Dvm644 etc/* "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/alien-console"
	install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
}
