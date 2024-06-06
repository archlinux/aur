# Maintainer: Andrew Rabert <ar@nullsum.net>
pkgname=unscrambler
pkgver=0.5.4
pkgrel=2

pkgdesc="unscramble not standard IVs scrambled DVDs thru bruteforce, intended for Gamecube/WII Optical Disks."
arch=('x86_64')
url="https://github.com/saramibreak/unscrambler"
license=('GPL-2.0-only')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c9756285e462c2b6583491992b34d35a066c147be3cf3cdeb96447b4bdb6a57f')

build() {
	cd "unscrambler-${pkgver}"

	make
}

package() {
	cd "unscrambler-${pkgver}"

	install -Dm 755 "unscrambler.out" -t "${pkgdir}/usr/bin"
	install -Dm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
