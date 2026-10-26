# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=2.0.126
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Adafruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}-amd64.deb::https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('374715f29481088532fe82eb038a8ab83360fbf2ed589a06837882aee26d905b9724f2f8fb5e95964747eb28f88fd3c308ffa1952b5bea375c0642d71fe437c1')

package(){

	# Extract package data
	tar xf data.tar.zst -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
