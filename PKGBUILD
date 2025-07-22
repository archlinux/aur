# Maintainer: Chance Parsons <chance lorne at icloud dot com>

pkgname="airport-utils-bin"
pkgver="2_8"
pkgrel=1
pkgdesc="Configuration and management utilities for Apple AirPort base stations"
arch=("x86_64")
depends=(java-environment)

source=(
		"http://ftp.ca.debian.org/debian/pool/main/a/airport-utils/airport-utils_2-8_all.deb"
)
sha256sums=('ee7106202f757bc3b5e8507fde72e5f7b16fdabab0d4620eb9d35ac5ec838188')

prepare() {
	mkdir -p output
	bsdtar -O -xf airport-utils_2-8_all.deb data.tar.xz | bsdtar -C output -xJf - #main extracted
}

package() {
	install -Dm755 output/usr/bin/* -t "$pkgdir/usr/bin"
	install -Dm644 output/usr/share/doc-base/* -t "$pkgdir/usr/share/doc-base/"
	install -Dm644 output/usr/share/doc/airport-utils/* -t "$pkgdir/usr/share/doc/airport-utils/"
	install -Dm644 output/usr/share/java/airport-utils/* -t "$pkgdir/usr/share/java/airport-utils/"
	install -Dm644 output/usr/share/menu/* -t "$pkgdir/usr/share/menu/"
	install -Dm644 output/usr/share/man/man1/* -t "$pkgdir/usr/share/man/man1/"
}
