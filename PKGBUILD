# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=unscrambler
pkgver=0.5.5
pkgrel=1

pkgdesc="unscramble not standard IVs scrambled DVDs thru bruteforce, intended for Gamecube/WII Optical Disks."
arch=('x86_64')
url="https://github.com/saramibreak/unscrambler"
license=('GPL-2.0-only')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5d0e9a18317a5b52e9b5e7babfcef00a775b8548fbbbb1451d75c5e05e037678')

build() {
	cd "unscrambler-${pkgver}"

	make
}

package() {
	cd "unscrambler-${pkgver}"

	install -Dm 755 "unscrambler.out" -t "${pkgdir}/usr/bin"
	install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
