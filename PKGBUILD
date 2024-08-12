# Maintainer: Chance Parsons <chance lorne at icloud dot com>

pkgname="airport-utils-bin"
pkgver="2_5"
pkgrel=1
pkgdesc="Configuration and management utilities for Apple AirPort base stations"
arch=("x86_64")
depends=(java-environment)

source=(
		"http://launchpadlibrarian.net/205833754/airport-utils_2-5_all.deb"
)
sha256sums=('912ea041fa86652550c9e9502a9e2fa58dd098a89b82491081d8e55e43db07de')

prepare() {
	mkdir -p output
	bsdtar -O -xf airport-utils_2-5_all.deb data.tar.xz | bsdtar -C output -xJf - #main extracted
}

package() {
	install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
	install -Dm644 output/usr/share/doc-base/* -t "$pkgdir/usr/share/doc-base/"
	install -Dm644 output/usr/share/doc/airport-utils/* -t "$pkgdir/usr/share/doc/airport-utils/"
	install -Dm644 output/usr/share/java/airport-utils/* -t "$pkgdir/usr/share/java/airport-utils/"
	install -Dm644 output/usr/share/menu/* -t "$pkgdir/usr/share/menu/"
	install -Dm644 output/usr/share/man/man1/* -t "$pkgdir/usr/share/man/man1/"
}
