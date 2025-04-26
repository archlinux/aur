# Maintainer: nomisge <nomisge @ live . de>
pkgname=microblocks
pkgver=2.0.39
pkgrel=1
pkgdesc="MicroBlocks is a free, blocks pogramming language for learning physical computing with educational microcontroller boards such as the micro:bit, Adafruit Circuit Playground Express, and many others."
arch=('x86_64')
url="http://microblocks.fun"
license=('MPL2')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("${pkgname}-${pkgver}-amd64.deb::https://microblocks.fun/downloads/v$pkgver/packages/ublocks-amd64.deb")
sha512sums=('5de5d319f6b7cb36e94c78a2b1043a540019a8bbbbefc81733e7c4ed939e474be50552abab925ed6fde86e651714c6de24b086f37e57d5101ec9df7e995580ae')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin
	sed -i s'#^Exec=/usr/local/bin/#Exec=/usr/bin/#g' "usr/share/applications/MicroBlocks.desktop"

	cd ..
}
