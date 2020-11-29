# Maintainer: nzbr <aur@nzbr.de>

pkgname=vlogsolv
pkgver=1.2
pkgrel=0
pkgdesc="cli program that calculates value tables for logical expressions"
arch=('x86_64')
url="https://github.com/nzbr/vlogsolv"
license=('ISC')
depends=()
makedepends=('git' 'gcc' 'make' 'vlang')
source=("$pkgname-$pkgver::git+https://github.com/nzbr/vlogsolv.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"

	v -o vlogsolv -prod -cc gcc -show_c_cmd -autofree .
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 vlogsolv  "$pkgdir/usr/bin/vlogsolv"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/vlogsolv/LICENSE"
}
